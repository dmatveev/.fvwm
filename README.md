Dmitry Matveev's FVWM configuration
===================================

Dependencies
------------
1. FVWM 2.6.5 or later. The configuration worked well on the previous versions,
   too, with some exceptions (see the commit log)
2. PERL
3. dmenu
4. xdpyinfo
5. sed, xargs and other standard stuff you should already have installed.
6. rxvt-unicode (by default, can be replaced with any other VTE in the config)
7. cyr-rfx* fonts (serenetypewriter is used by default, can be changed to any
   other font).

Installation
------------
Just clone this repo into your `~/.fvwm` directory and (re)start FVWM. No
additional actions should be required.

Hotkeys
-------
* `F2` -- open a new terminal
* `F3` -- open dmenu (lists all available binaries in current PATH)
* `F12` -- lock screen with xscreensaver

* `Ctrl+Alt+Left` -- open desktop to the left of the current
* `Ctrl+Alt+Right` -- open desktop to the right of the current

* `Alt+[0..9]` -- open [1..10]th desktop
* `Super+[0..9]` -- open [11..20]th desktop

* `Super+<Arrow key>` -- move mouse pointer 75 pixels in the given direction
* `Shift+Super+<Arrow key>` -- move mouse pointer 15 pixels in the given
  direction
* `Ctrl+Super+<Arrow key>` -- move mouse pointer 1 pixel in the given direction

* `Alt+C` -- close current window
* `Alt+Return` -- toggle maximize/unmaximize current window
* `Alt+Left` -- move window to the left neighbour desktop
* `Alt+Right` -- move window to the right neighbour desktop
* `Super+Space` -- center current window on the screen

* `Super+R` -- start resizing current window. `Return` applies changes,
  `Esc` discards it.
* `Super+R` -- start moving current window. `Return` applies changes,
  `Esc` discards it.

* `Alt+Tab` -- open Fvwm Window List

About
-----
Originally written and used by Dmitry Matveev in 2010..2013.
Licensed under BSD.
