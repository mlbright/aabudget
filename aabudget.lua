function shallowcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == "table" then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
			copy[orig_key] = orig_value
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

function findCombinations(items, costs, max_cost)
	local combinations = {}

	function backtrack(current_combination, current_cost)
		if current_cost > max_cost then
			return
		end

		if #current_combination ~= 0 then
			table.insert(combinations, { shallowcopy(current_combination), current_cost })
		end

		for i = 1, #items do
			local item = items[i]
			local cost = costs[i]

			table.insert(current_combination, item)
			current_cost = current_cost + cost

			backtrack(current_combination, current_cost)

			table.remove(current_combination)
			current_cost = current_cost - cost
		end
	end

	backtrack({}, 0)
	return combinations
end

items = { "Infantry", "Artillery", "Tank", "Fighter", "Bomber" }
costs = { 3, 4, 6, 10, 12 }
max_cost = 42

combinations = findCombinations(items, costs, max_cost)

for i, combination in ipairs(combinations) do
	print("Combination " .. i .. ":")
	for _, item in ipairs(combination[1]) do
		print("  " .. item)
	end
	print("  Cost: " .. combination[2])
end
