#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from collections import Counter


def find_results(items, costs, budget):
    def backtrack(current_combination, current_cost, idx):
        if current_cost < 0:
            return

        # If the current combination is valid, copy it to the list of results
        if current_combination:
            results.append(current_combination[:])

        # Try adding each type of item starting from the current position
        for i in range(idx, len(items)):
            item = items[i]
            cost = costs[i]

            max_number_item = current_cost // cost

            for j in range(max_number_item):
                num_added_units = j + 1
                current_combination.extend([item] * num_added_units)
                current_cost -= cost * num_added_units

                # Recurse with the updated combination and cost
                backtrack(current_combination, current_cost, i + 1)

                # Backtrack: remove the last item added
                # current_combination = current_combination[:-num_added_units] # this doesn't work?
                # del current_combination[-2:]
                for _ in range(num_added_units):
                    current_combination.pop()
                current_cost += cost * num_added_units

    # store all valid combinations
    results = []

    # Start the backtracking process
    backtrack([], budget, 0)

    return results


def print_combination(c: Counter):
    counts = []
    cost = 0
    for k in sorted(c.keys()):
        counts.append(f"{k}: {c[k]}")
        cost += c[k] * costs[items.index(k)]
    print(", ".join(counts), f"=> cost: {cost}")


items = [
    "Infantry",
    "Artillery",
    "Tank",
    "Fighter",
    "Bomber",
    "Submarine",
    "Transport",
    "Destroyer",
    "Cruiser",
    "Aircraft Carrier",
    "Industrial Complex",
    "Battleship",
]
costs = [3, 4, 6, 10, 12, 6, 7, 8, 12, 14, 15, 20]
budget = 42

results = find_results(items, costs, budget)

for combo in results:
    # print(f"Items: {combo}, Cost: {cost}")
    print_combination(Counter(combo))
