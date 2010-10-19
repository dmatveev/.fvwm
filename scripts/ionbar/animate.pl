#!/usr/bin/perl -w

use strict;
use Fcntl ':flock';

$| = 1;

if (open LH, $0) {
    if (!flock LH, LOCK_EX|LOCK_NB) {
        die "Looks like already running\n"
    }
}
else {
    die "What?\n"
}

while (1) {
    for (my $i = 0; $i < 20; $i++) {
        system (sprintf ("echo LoadDeskColorsets %d | FvwmCommand -c", $i));
        sleep (10);
    }
}
