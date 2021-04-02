---
title: "Simplified Python Parallelization"
date: 2018-03-31T19:13:37-04:00
lastmod: 2021-03-31T20:16:14-04:00
tags: ["python"]
draft: false
aliases:
    - /posts/simplified-python-parallelization
---
### Update:
I've since moved onto the standard library's [concurrent.futures](https://docs.python.org/3/library/concurrent.futures.html)
module for when I need a pool of processes.
It's *good enough* and doesn't require external dependencies.

---

*Using Python 3.6*

I fell in love when I first discovered Python's [`multiprocessing.Pool`](https://docs.python.org/3/library/multiprocessing.html#multiprocessing.pool.Pool).
It provided a simple API for consuming an iterable over multiple
child processes. It fit perfectly with my immediate needs —
isolated, atomic operations.

However, a flaw, or rather—*an oddity*—soon revealed itself when using this
module for tasks requiring state persistence. This frustration, among others,
resulted in the birth of the [consumers](https://github.com/nvllsvm/consumers) package.

Before getting into that, here is how [`multiprocessing.Pool`](https://docs.python.org/3/library/multiprocessing.html#multiprocessing.pool.Pool) is *awesome*.


## Isolated, Atomic Operations
Using [`multiprocessing.Pool`](https://docs.python.org/3/library/multiprocessing.html#multiprocessing.pool.Pool) for processing which requires no persistence
outside of the processing function is where it makes the most sense. An ETL
process dealing solely with files, for example, would be ripe for usage with
it.

```python
def process(path):
    data = read_and_transform(path)
    with open(path, 'w') as f:
        f.write(data)

with multiprocessing.Pool() as pool:
    pool.map(process, paths)
```

Files paths are distributed to child processes which read, transform,
and write the results. Nothing is shared between the processing of each file.


## State Persistence: *The Hack*
Instead of writing to a file, let's say you want to update a database.
It's not efficient to open a new connection for each file so you'll want to
persist the connection throughout the life of each child process.

Using [`multiprocessing.Pool`](https://docs.python.org/3/library/multiprocessing.html#multiprocessing.pool.Pool), you could end up with something like this:

```python
connection = None

def init(config):
    global connection
    connection = db_connect(config)

def process(path):
    global connection
    data = read_and_transform(path)
    connection.insert(data)

with multiprocessing.Pool(initializer=init, (config,)) as pool:
    pool.map(process, paths)
```

Yuck! This not how I like to structure my code. Any use of globals outside of
constants feels like a hack to a problem with a better solution.

Now some of you might be thinking that you could use callable classes or
similar to avoid use of globals. True—there are other ways, but they
are unnecessarily complex when you ultimately just want to iterate over data.


## State Persistence: *The Sane*
This is where [consumers](https://github.com/nvllsvm/consumers) comes in. Instead of the one-to-one
relationship [`multiprocessing.Pool`](https://docs.python.org/3/library/multiprocessing.html#multiprocessing.pool.Pool) has between target function and individual
datum, [`consumers.Pool`](https://consumers.readthedocs.io/en/latest/api.html#pooll) has a one-to-one relationship between target function
and child process.

```python
def process(paths, config):
    connection = db_connect(config)
    for path in paths:
        data = read_and_transform(path)
        connection.insert(data)

with consumers.Pool(process, args=(config,)) as pool:
    for path in paths:
        pool.put(path)
```

No globals; no separate initializer function. Just a single function which
receives an ordinary generator and optionally the initializer *args* and
*kwargs*.


## Process Completion
The [`consumers.Pool`](https://consumers.readthedocs.io/en/latest/api.html#pooll) also supports functionality that is not possible with
[`multiprocessing.Pool`](https://docs.python.org/3/library/multiprocessing.html#multiprocessing.pool.Pool) — logic upon child process completion.

Imagine if I instead wanted to insert *all* the results into the database with
a single query run at the end of each process.

```python
def process(paths, config):
    connection = db_connect(config)
    results = []
    for path in paths:
        data = read_and_transform(path)
        results.append(data)
    connection.insert(results)

with consumers.Pool(process, args=(config,)) as pool:
    for path in paths:
        pool.put(path)
```

That's it—nothing special required. It's simply a side-effect
of having control of both *how* and *when* an item is consumed.


## tl;dr
[`multiprocessing.Pool`](https://docs.python.org/3/library/multiprocessing.html#multiprocessing.pool.Pool) is part of the Python standard library, is great
for basic tasks, but often feels unnatural for everything else.

[`consumers.Pool`](https://consumers.readthedocs.io/en/latest/api.html#pooll) is part of the [consumers](https://github.com/nvllsvm/consumers) package, has a minimal API,
and provides fine control in an organic way.
See the [docs for additional examples](https://consumers.readthedocs.io/en/latest/examples.html).
