# aabudget

> Axis and Allies budget calculator

## Overview

There are a few [Axis and Allies](https://en.wikipedia.org/wiki/Axis_%26_Allies) combat odds calculators out there ([this one](https://aa1942calc.com/) is particularly nice) but I wanted to automatically calculate the number and type of units I could buy with a given budget.
These 2 scripts will calculate all possible combinations of units that can be bought with a given budget.

Reminded myself about [backtracking algorithms](https://www.geeksforgeeks.org/backtracking-algorithms/).

Learned a little bit of Lua.

## Usage

```bash
python3 aabudget.py
```

```bash
luajit aabudget.lua
```

## Timing/Benchmarking

```bash
time luajit aabudget.lua > /dev/null
time python3 combo-backtracking.py > /dev/null
```
