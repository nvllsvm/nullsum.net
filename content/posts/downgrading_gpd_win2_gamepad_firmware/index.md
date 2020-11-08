---
title: "Bypassing GPD Win 2 Firmware Downgrade Protection"
date: 2020-04-19T12:28:50-04:00
tags: ["gpd win 2, hack"]
draft: false
aliases:
    - /posts/downgrading_gpd_win2_gamepad_firmware
---
There are three different firmwares for the GPD Win 2 gamepad - each having
different "opinions" in terms of bindings and joystick behaviors. It is
not possible to downgrade the firmware after updating - leaving one stuck
with whatever opinions the latest firmware has.

Some of the various differences in gamepad behavior are listed below.

- v1.11
    - D-pad as WASD keys 
    - Left joystick as scroll wheel
- v1.18
    - D-pad as scroll wheel
    - Left joystick as WASD keys
- v1.19
    - Joystick diagonal behavior altered

## Patching the installers
I've previously had luck with [7z](http://p7zip.sourceforge.net/) extracting executables
so that's where I started. All three of the extracted executables contained the same files.
Pruning duplicates left me with the following files - all the exact same size.

```
$ du */.*
296     v111/.rdata
1172    v111/.text
296     v118/.rdata
1172	v118/.text
296     v119/.rdata
1172	v119/.text
```

I proceeded to use xxd to dump the executables to hex files.

```
$ xxd v111.exe v111.xxd
$ xxd v118.exe v118.xxd
$ xxd v119.exe v119.xxd
```

Versions 1.18 and 1.19 were compared first as each more similar to each
other than v1.11 in terms of features.

```
$ diff v118.xxd v119.xxd
```

The diff output ended up being exactly 2092 lines - a good sign! I started
by searching for the minor version of each firmware - **18** and **19**.
There were two locations where the diff indicated that 18 was changed to 19.

```diff
16c16
344c344
< 00001570: e8a0 cf00 00c7 8630 0100 0018 0100 008a  .......0........
---
> 00001570: e8a0 cf00 00c7 8630 0100 0019 0100 008a  .......0........
367c367
< 000016e0: 0000 52ff d681 3d84 6057 0018 0100 0076  ..R...=.`W.....v
---
> 000016e0: 0000 52ff d681 3d84 6057 0019 0100 0076  ..R...=.`W.....v
```

Comparing 1.11 to 1.18 further reinforced my assumption:

```diff
344c344
< 00001570: e8a0 cf00 00c7 8630 0100 0011 0100 008a  .......0........
---
> 00001570: e8a0 cf00 00c7 8630 0100 0018 0100 008a  .......0........
367c367
< 000016e0: 0000 52ff d681 3d84 6057 0011 0100 0076  ..R...=.`W.....v
---
> 000016e0: 0000 52ff d681 3d84 6057 0018 0100 0076  ..R...=.`W.....v
```

Through trial and error, I discovered that the first line is used only for
display in the UI - no reason to change it. The second line is used in the
check which prevents downgrading the firmware.

I changed `0018` to `0099` in the second line and transformed the dump back to a binary.

```diff
367c367
< 000016e0: 0000 52ff d681 3d84 6057 0099 0100 0076  ..R...=.`W.....v
---
> 000016e0: 0000 52ff d681 3d84 6057 0019 0100 0076  ..R...=.`W.....v
```

```shell
$ xxd -r v118.xxd v118_patched.exe
```

## Retro
This simple change allowed me to bypass the installer's downgrade "protection" without
altering how the firmware identifies itself. I was able to install each version of the firmware
without issue.

Downloads for the patched installers:
- [v1.11](gpd_win_2_gamepad_V1.11_20180105_downgradeable.exe.tar.zst)
- [v1.18](gpd_win_2_gamepad_V1.18_20180314_downgradeable.exe.tar.zst)
- [v1.19](gpd_win_2_gamepad_V1.19_20180531_downgradeable.exe.tar.zst)
