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

function findResults(items, costs, max_cost)
	local combinations = {}

	function backtrack(current_combination, current_cost)
		if current_cost > max_cost then
			return
		end

		if #current_combination ~= 0 then
			table.insert(combinations, shallowcopy(current_combination))
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

items = {
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
}

inverse_index = {}
for idx, i in ipairs(items) do
	inverse_index[i] = idx
end

costs = { 3, 4, 6, 10, 12, 6, 7, 8, 12, 14, 15, 20 }
max_cost = 42

combinations = findResults(items, costs, max_cost)

for _, combination in ipairs(combinations) do
	count = {}
	for _, item in ipairs(combination) do
		count[item] = (count[item] or 0) + 1
	end
	cost = 0
	i = 1
	count_length = tablelength(count)
	table.sort(count)
	for item, c in pairs(count) do
		io.write(item .. ": " .. c)
		cost = cost + c * costs[inverse_index[item]]
		if i ~= count_length then
			io.write(", ")
		end
		i = i + 1
	end
	io.write(" => cost: " .. cost)
	print()
end
