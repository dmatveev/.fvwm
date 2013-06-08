#!/usr/bin/perl -w

use strict;
use FindBin qw($Bin); 

# open the file
if ($#ARGV + 1 < 1) {
    die "Please specify a file name\n";
}
open (OUT, ">$ARGV[0]");

my $base      = 10;
my $activecs  = 30;
my $ykludge   = 2;
my $buttons   = 20;
my $wndheight = 18;
my $btnheight = 16 + $ykludge;
my $btnposy   = 0  - $ykludge;

# get the screen resolution
my $resx = 0;
my $resy = 0;
my $dimensions = (grep (/dimensions/, `xdpyinfo`))[0];
if ($dimensions =~ /.*:\s+(\w+)x(\w+)/) {
    $resx = $1;
    $resy = $2;
}
else {
    close (OUT);
    die "Could not parse xdpyinfo\n";
}

# perform some calculations
my $btnwidth = int ($resx / $buttons);
my $spacelft = $resx - ($buttons * $btnwidth);

# the ionbar heading
print OUT header ($resx, $wndheight); 

# add spaces if required
my $offset = 0;
my $spacesz = int ($spacelft / 2);
if ($spacesz > 0) {
    $offset += $spacesz;
}

for (my $i = 0; $i < $buttons; $i++) {
    my $tmp = $i + 1;
    my $tmb = $i + $base;
    my $pos = $offset + $btnwidth * $i;

    print OUT widget      ($tmp, $pos, $btnposy, $btnwidth, $btnheight);
    print OUT title       ($tmp);
    print OUT colorset    ($tmb);
    print OUT desk_script ($tmp, $i, $tmb, $activecs);
    print OUT end_widget  ();
}

# echo the border
print OUT widget     (40, 0, 16, $resx, 2);
print OUT color      ("#a9a9a9");
print OUT end_widget ();

close (OUT);
print "Nop\n";

#-------------------------------------------------------------------------------
# widget factory functions

# id, posx, posy, width, height
sub widget {
    return sprintf ("
Widget %d
Property
  Position %d %d
  Size %d %d
  Flags NoReliefString
  Type ItemDraw
", @_);
}

# colorset number
sub colorset {
    return sprintf (
"  Colorset %d
", @_);
}

# id, desk number, colorset, active colorset
sub desk_script {
    my $id    = shift;
    my $deskn = shift;
    my $cset  = shift;
    my $acset = shift;
    return sprintf ('
  Main
  Case message of
  SingleClic :
  Begin
    Do {GotoDesk 0 %d}
  End
  1 :
  Begin
    ChangeColorset %d %d
  End
  2 :
  Begin
    ChangeColorset %d %d
  End
  3 :
  Begin
    Set $str = (LastString)
    ChangeTitle %d $str
  End
', $deskn, $id, $acset, $id, $cset, $id);
}

sub end_widget {
    return "End\n"
}

# color (in hex)
sub color {
    return sprintf ("
  BackColor {%s}
", @_);
}

# width, height, 
sub header  {
    return sprintf ("
WindowTitle    {Ionbar}
WindowSize     %d %d
WindowPosition 0 0
ForeColor      {black}
BackColor      {grey85}
ShadowColor    {grey55}
HilightColor   {grey100}
Font           -*-serenetypewriter-bold-*-*-*-12-*-*-*-*-*-*-ru

Init
  Begin
  End
", @_);
}

# text
sub title {
    return sprintf ("
  Title {:%d}
", @_);
}
