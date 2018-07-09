<!--
.. title: Custom Mechanical Keyboards
.. slug: custom-mechanical-keyboards
.. date: 2018-07-03 14:49:00 UTC-04:00
.. tags: keyboards
.. category: 
.. link: 
.. description: My minimalist custom mechanical keyboards.
.. type: text
-->

This is the 10th year I've been using mechanical keyboards - specifically with Cherry MX Blue switches and blank keycaps.
Numerous keyboards and a few jobs later, the majestic clack is still *euphoric*.

![top-down: travel, work, home](/images/custom-mechanical-keyboards/keyboards.jpg)

From the top down are my current travel, work, and home setups. The top keyboard is the first I built and was 
done so from a kit.
The other two are built as this article describes. All keyboards are running the same firmware with the 
same layout. I value consistency **a lot** as it's one less think about or adjust to.

If you're curious, I love the [Zowie FK1](https://zowie.benq.com/en/product/mouse/fk/fk1.html) mouse due its simple looks,
lack of specialized drivers, and lack of hardware acceleration.

# Build
After rotating through a number of preassembled keyboards and one DIY kit, I knew my preferences and decided to build the keyboard
which embodied them all.

- **60% Layout** - Having owned both full-size and [tenkeyless](https://deskthority.net/wiki/Tenkeyless_keyboard) keyboards, I
  preferred the smaller footprint of a 60%. The seldom used keys (arrows, F*) are more accessible with combinations or remapped
  keys with minimal hand movement. The [Pok3r](https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=1238) was my first
  60% keyboard. Loved it so much I bought a second one to keep at work.
- **Open Firmware** - As much as I loved the size and layout of the Pok3r, remapping keys was limited. Things were either too cumbersome
  or impossible to remap to. The other problem was keeping the layouts consistent between home and work. I needed to move to a more stable
  configuration and [QMK Firmware](https://qmk.fm/) supported keyboard was a must.
- **Arrow Keys** - The right shift key is useless to me. Touch typists may disagree, but years of gaming with WASD+Left Shift
  have made me a dedicated left shifter.
- **Plate Mount Stabilizers** - These look, feel, and sound better than PCB mount stabilizers.
- **Detachable Cable** - Cable management and cleaning becomes much easier when the cable is the right length and moving the
  keyboard does not require crawling under a desk.
- **Hotswap Switches** - Sure, why not?
- **Looks** - Blank, black, and no bullshit.

I eventually decided on the following parts for the keyboards. All are all off-the-shelf except for the plate
which was custom ordered ordered using [swillkb plate and case builder](http://builder.swillkb.com/) and painted with
black Plasti Dip.

* [Sentraq 60% RGB Underglow PCB](https://sentraq.com/collections/frontpage/products/60-rgb-underglow-pcb)
* [Sentraq 60% aluminum case *(black)*](https://sentraq.com/products/60-aluminum-milled-case?variant=22686831687)
* [Cherry plate mount stabilizers](https://sentraq.com/collections/accesories/products/cherry-stabilizers?variant=26988488327)
* [Cherry MX Blue PCB mount switches](https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=1041)
* [8134-HC-8P2 sockets](https://www.digikey.com/product-detail/en/te-connectivity-amp-connectors/8134-HC-8P2/A114358-ND/2188091)
* [Lasergist custom order 1.5mm steel plate](http://builder.swillkb.com/)
* [Gateron PBT keycaps *(blank, black)*](https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=1652)


# Layout

As mentioned earlier, the popular and very active [QMK Firmware](https://docs.qmk.fm) powers my keyboards with
a layout customized to meet my desires.

The source code for my layout can be found [here](https://github.com/nvllsvm/dotfiles/blob/master/qmk_firmware/s60_x/mine/keymap.c).

![my layout](/images/custom-mechanical-keyboards/layout.png)
