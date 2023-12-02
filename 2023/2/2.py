#!/usr/bin/env python3

import sys

s = 0

for line in sys.stdin:
    [num, game] = line.strip().split(":")
    maxes = {"red": 0, "green": 0, "blue": 0}
    for cube in sum([g.split(",") for g in game.split(";")], []):
        [_, count, color] = cube.split(" ")
        maxes[color] = max(maxes[color], int(count))
    s += maxes["red"] * maxes["green"] * maxes["blue"]

print(s)
