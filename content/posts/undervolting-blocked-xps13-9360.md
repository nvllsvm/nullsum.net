---
title: "Intel and Dell broke undervolting on my XPS 13"
date: 2021-02-23T12:51:12-05:00
tags: ["intel"]
draft: false
unlisted: true
aliases:
    - /posts/undervolting-xps13-9360
---
Ugh, my aging XPS 13 (9360 motherboard, Intel i7-8550U) becomes perceptually slower
with each security vulnerability mitigation. One of these mitigations also noticeably
increased both heat output and power consumption by breaking my ability
to manage the system's power usage more effectively than 
Intel and Dell's defaults.

Dubbed [Plundervolt](https://plundervolt.com/), the vulnerability in topic relates exclusively to corrupting 
the integrity of Intel SGX - a mechanism used to prevent
even the kernel access to specific regions of memory.
For the XPS 13 9360, the vulnerability was patched in [BIOS update 2.14.2](https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=0cy6w&oscode=biosa&productcode=xps-13-9360-laptop).
Though this had the side effect of **completely blocking the ability to undervolt** - even for people like me with
SGX disabled in UEFI settings.

I only realized this months after updating to BIOS on my laptop when I noticed that
the [intel-undervolt](https://github.com/kitsunyan/intel-undervolt) tool was no longer working [[related issue](https://github.com/kitsunyan/intel-undervolt/issues/43)]:
```
$ intel-undervolt
CPU (0): Values do not equal
GPU (1): Values do not equal
CPU Cache (2): Values do not equal
System Agent (3): -0.00 mV
Analog I/O (4): -0.00 mV
```

My sweet **-100 mV** undervolt on CPU, GPU, and CPU cache was gone. 
My **~18% reduction in idle power consumption** was no more!

This probably explains why my machine was running louder, hotter, and slower in recent months.
All to solve a vulnerability that impacts Intel's "security feature" I keep disabled anyway.

Thankfully, Dell allows for BIOS downgrades so I downgraded to the previous [BIOS version 2.13.0](https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=c9j4k).
This restored my ability to undervolt and made my Intel-based laptop slightly less shitty.

As for microcode updates, I'm still able to run the latest due to [Arch Linux making this very easy](https://wiki.archlinux.org/index.php/Microcode).
