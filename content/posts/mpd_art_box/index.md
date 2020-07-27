---
title: "mpd-art-box: Minimalist MPD cover art display"
date: 2020-07-26T22:21:23-04:00
tags: ["mpd", "python"]
draft: false
aliases:
    - /posts/mpd-art-box
---
I've been a user of the terminal-based [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp) for over a decade.
It's lightweight, simple, and does everything I need to control playback of music with one exception - displaying
cover art. After recently starting to learn [PyGObject](https://pygobject.readthedocs.io/en/latest/)
for Pinephone app development, it became clear that
I could also use PyGObject to create the missing piece in my PC music playback environment - covert art display.

Thus, [mpd-art-box](https://github.com/nvllsvm/mpd-art-box) was created.

The project was started ~12 hours ago and ended up being usable a few hours later. Nothing fancy - just 127 lines of Python
which creates a window to show cover art for the current song that MPD is playing. Very pleased how quick it was
to create and how little code there is.

The result looks great, especially when sharing a split [i3](https://i3wm.org/) layout with ncmpcpp.

[![screenshot](screenshot.jpg)](screenshot.jpg)

Next is figuring out how fill the extra space of the window with a blurred version of the cover.
