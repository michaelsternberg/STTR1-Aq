STTR1-Aq
========
Overview
--------
STTR1-Aq is a Mattel/Radofin Aquarius port of the 1972 Star Trek text game STTR1, written by Mike Mayfield for HP2000C Time-Shared BASIC and published in Hewlett Packard's Contributed Library. The target platform is an Aquarius home computer with 16K RAM memory cartridge (20K total) and Microsoft BASIC S2 in ROM.

This project was part of [Retrochallenge 2016/01](http://www.wickensonline.co.uk/retrochallenge-2012sc/rc201601-entrants-list/). My Retrochallenge 2016/01 web log begins  [here](http://16kram.com/2015/12/02/retrochallenge-201601-prologue-2/).

Files
-----
 * `sttr1-aq.bas` - Aquarius BASIC listing
 * `sttr1-aq.caq` - Aquarius BASIC listing saved as a cassette image
 * `sttr1-aq.bin` - Aquarius BASIC listing LDUMP'ed using [BLBasic v2.1](http://atariage.com/forums/topic/232773-aquarius-blbasic-v20/?p=3139181).

How to Run
----------
  * To run this game in the MESS emulator, load the file `sttr1-aq.bin` as a cartridge.

  `mess aquarius -ramsize 20K -cart sttr1-aq.bin`

  Note:  I have noticed some odd behavior when running with this configuration.

  * To run this game in the Virtual Aquarius emulator for Windows (or WINE on Linux or OSX).
    1. In the Virutal Aquarius menubar, select `Configure`-->`Memory` and ensure the 16K or 32K option is enabled.
    2. In the Virtual Aquarius menubar, select `File` --> `Play Cassette File...`, and select the file `sttr1-aq.caq`
    3. At the BASIC prompt, type `CLOAD 'STTR1'` and press `RETURN` twice.
    4. At the BASIC prompt, type `RUN`

   or
    1. Copy/Paste the contents of `sttr1-aq.bas` into Virual Aquarius using the menu item `Util`-->`Paste`.


  * To run this game on a real Aquarius, use the Virtual Aquarius tool CAQ2WAV.EXE to convert `sttr1-aq.caq` to a WAV file. The WAV file can be transferred to a magnetic cassette tape and loaded using the Aquarius Data Recorder.

Original Source Listing
-----------------------
The original HP Time-Shared BASIC listing on which this project was derived can be found [here](http://web.archive.org/web/20150215080553/http://www.dunnington.u-net.com/public/startrek/STTR1).

Modifications from Original
---------------------------
The port attempts to leave as much of the original source code untouched, however because the original program assumed a teletype terminal and the target Aquarius is a CRT television with 40 character-wide display, some changes were necessary.

  * To conserve RAM on the Aquarius, many separate lines of BASIC were condensed to a single line using the ":" command separator.
  * The instructions dialog includes an option to print to the screen or to the Aquarius thermal printer.
  * The instructions were re-arranged to fit on a 40 character CRT display.
  * The short range view prints the Stardate, Current Coordinates, etc above the 8x8 grid instead of beside it.
  * Some messages were either changed from a single line to multiple lines to prevent wrap-around text.
  * Some messages were abbreviated or shortened to prevent wrap-around text or improve readability.
  * The implementation of strings differed so much between the two systems, that the original character strings Q$[72], R$[72], and S$[48] were converted to a one dimensional array of strings Q$(64). Each 64 elements in the array represents one of the locations in the 8x8 Quadrant.
