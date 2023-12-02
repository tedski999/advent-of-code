#!/usr/bin/env python3

import sys

s = 0

for line in sys.stdin:
    [num, game] = line.strip().split(":")
    for cube in sum([g.split(",") for g in game.split(";")], []):
        [_, count, color] = cube.split(" ")
        if int(count) > {"red": 12, "green": 13, "blue": 14}[color]:
            break
    else:
        s += int(num[5:])

print(s)
