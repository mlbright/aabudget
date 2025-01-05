def find_combinations(items, costs, max_cost):
    def backtrack(current_combination, current_cost):
        if current_cost <= 0:
            return

        # If the current combination is valid, copy it to the list of combinations
        if current_combination:
            combinations.append(current_combination[:])

        # Try adding each type of item starting from the current position
        for i in range(len(items)):
            item = items[i]
            cost = costs[i]

            current_combination.append(item)
            current_cost -= cost

            # Recurse with the updated combination and cost
            backtrack(current_combination, current_cost)

            # Backtrack: remove the last item added
            current_combination.pop()
            current_cost += cost

    # store all valid combinations
    combinations = []

    # Start the backtracking process
    backtrack([], max_cost)

    return combinations


# Example usage
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
    "Battleship",
]
costs = [3, 4, 6, 10, 12, 6, 7, 8, 12, 14, 20]
max_cost = 42

combinations = find_combinations(items, costs, max_cost)

from collections import Counter

for combo in combinations:
    # print(f"Items: {combo}, Cost: {cost}")
    print(f"Items: {Counter(combo)}")
