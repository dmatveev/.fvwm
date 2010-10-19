#!/usr/bin/perl

$base = 10;
$buttons = 20;
@spectrum = ("ff0025", "ff0072", "ff00be", "ee00fa", "a500ff", "5900ff",
             "1004ff", "0040ff", "008cff", "00d9ff", "00ffd7", "00ff8b",
             "00ff3e", "11ff03", "5aff00", "a7ff00", "effa00", "ffbd00",
             "ff7000", "ff2300");

for ($i = 0; $i < $buttons; $i++) {
    printf "Colorset %d fg black, bg #%s, bgTint white 45 \n",
    $i + $base, @spectrum[($i + $ARGV[0]) % $buttons];
}
