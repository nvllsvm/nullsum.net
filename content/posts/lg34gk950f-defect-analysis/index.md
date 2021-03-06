---
title: "LG 34GK950F defect analysis"
date: 2021-03-12T14:44:57-05:00
lastmod: 2022-01-09T18:10:48-05:00
tags: ["lg"]
draft: false
aliases:
    - /posts/lg34gk950f-defect-analysis
---
The [LG 34GK950F-B](https://www.lg.com/us/monitors/lg-34GK950F-B-gaming-monitor)
monitor I purchased in May 2019 has died. Its fate is the "horizontal lines" issue that many others have reported [[1]](https://www.amazon.com/LG-34GK950F-B-34-21-Ultragear/product-reviews/B0798Q8KG4/ref=cm_cr_arp_d_viewopt_kywd?ie=UTF8&reviewerType=all_reviews&pageNumber=1&filterByKeyword=lines).

This is not what a $799 display should look like, but here we are.

![lines](lines.jpg)

## Onset
While using the display, it randomly made a buzzing sound as horizontal lines appears on the display - still usable albeit
in a degraded state. A few seconds later, the entire display turned into the picture above - completely unusable.
There was a loud buzzing sound from the lower right of the display throughout all of this.

## Analysis
There were no signs of damaged components on the PCBs as I gradually disassembled the display.
Only when I reached the panel did I notice something off - one of the ribbons connected
to the panel looked different than the others.

The display is upside down in this picture. The pink arrow corresponds to the
location where I initially heard the buzzing sound.
![outlier](outlier.jpg)

The problem.
![char2](char2.jpg)

Under a microscope, I can clearly see that **ribbon cable caught on fire at some point**.
![char1](char1.jpg)


## Outcome
I don't know of a way to repair this. The ribbon cable is directly connected to the PCB and, seemingly, the LCD.
A hot air reflow tool might help with the PCB, but I'm not certain it would with the LCD.

Honestly, I feel ripped off. $799 for a monitor only to have it break in less than two years of **normal use**.
Worse, I'm concerned about the safety implication this poses to others suffering from the same problem.

## Update
LG offered me free repair (including shipping) of the monitor after sending them a link to this blog post.
I received my "repaired" display about a month after shipping it to them. While the display now worked, there was a
noticeable hair stuck in the middle of the screen between the panel and glass.

{{< gallery class="content-gallery" >}}
  {{< figure src="repair1_hair.jpg" link="repair1_hair.jpg" class="content-gallery-image" >}}
{{< /gallery >}}

I contacted support yet again and was offered a second repair - also free of charge.
Another month later and the "repaired" display is back in my hands... with two issues this time:
a blue, stuck pixel and a black smudge.

{{< gallery class="content-gallery" >}}
  {{< figure src="repair2_blue_spot.jpg" link="repair2_blue_spot.jpg" class="content-gallery-image" >}}
  {{< figure src="repair2_black_smudge.jpg" link="repair2_black_smudge.jpg" class="content-gallery-image" >}}
{{< /gallery >}}

I understand that LG is offering me free repairs on an out-of-warranty item, but
they assured me that the service I received was **no different than the service they charge money for**.
What the fuck...

My next interaction with LG support ultimately resulted in me sending the monitor to them in exchange
for a $680 check - about $170 less than what I initially paid for the monitor in 2019.
