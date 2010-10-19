#!/usr/bin/perl

for ($i = 1; $i <= 10; $i++) {
    $key = $i % 10;
    printf "Key %d A M GotoDesk 0 %d\n", $key, $i - 1;
    printf "Key %d A 4 GotoDesk 0 %d\n", $key, $i + 9;
}
