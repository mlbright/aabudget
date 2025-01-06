function tablelength(T)
	local count = 0
	for _ in pairs(T) do
		count = count + 1
	end
	return count
end

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

function findResults(items, costs, budget)
	local results = {}

	function backtrack(current_combination, current_cost, idx)
		if current_cost < 0 then
			return
		end

		if #current_combination ~= 0 then
			table.insert(results, shallowcopy(current_combination))
		end

		for i = idx, #items do
			local item = items[i]
			local cost = costs[i]

			max_number_items = math.floor(current_cost / cost)

			for j = 1, max_number_items do
				for k = 1, j do
					table.insert(current_combination, item)
					current_cost = current_cost - cost
				end

				backtrack(current_combination, current_cost, i + 1)

				for k = 1, j do
					table.remove(current_combination)
					current_cost = current_cost + cost
				end
			end
		end
	end

	backtrack({}, budget, 1)
	return results
end

items = {
	"Infantry",
	"Artillery",
	"Anti-Aircraft Gun",
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
}

inverse_index = {}
for idx, i in ipairs(items) do
	inverse_index[i] = idx
end

costs = { 3, 4, 5, 6, 10, 12, 6, 7, 8, 12, 14, 15, 20 }
budget = 42

combinations = findResults(items, costs, budget)

for _, combination in ipairs(combinations) do
	count = {}
	for _, item in ipairs(combination) do
		count[item] = (count[item] or 0) + 1
	end
	tkeys = {}
	for k in pairs(count) do
		table.insert(tkeys, k)
	end
	table.sort(tkeys)
	cost = 0
	i = 1
	count_length = tablelength(count)
	for _, k in ipairs(tkeys) do
		io.write(k .. ": " .. count[k])
		cost = cost + count[k] * costs[inverse_index[k]]
		if i ~= count_length then
			io.write(", ")
		end
		i = i + 1
	end
	io.write(" => cost: " .. cost)
	print()
end
