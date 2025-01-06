# aabudget

> Axis and Allies budget calculator

## Overview

There are a few [Axis and Allies](https://en.wikipedia.org/wiki/Axis_%26_Allies) combat odds calculators out there ([this one](https://aa1942calc.com/) is particularly nice) but I wanted to automatically calculate the number and type of units I could buy with a given budget.
These 2 scripts will calculate all possible combinations of units that can be bought with a given budget.

Reminded myself about [backtracking algorithms](https://www.geeksforgeeks.org/backtracking-algorithms/).

Learned a little bit of Lua.

The Lua script is faster than the Python script: interesting.

## Usage

```bash
python3 aabudget.py
```

```bash
luajit aabudget.lua
```

## Timing/Benchmarking

```bash
hyperfine --warmup 1 ./aabudget.py
```

```bash
hyperfine --warmup 1 luatest.sh
```

## TODO

- [ ] Add a GUI as a GitHub Pages site: convert to JavaScript/HTML/CSS and dynamically update the page as the user types in the budget and clicks the units that they intend to buy.
