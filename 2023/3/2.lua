#!/usr/bin/env lua

lines = {}
table.insert(lines, "..............................................................................................................................................")
for s in io.read("*a"):gmatch("[^\n]+") do table.insert(lines, "."..s..".") end
table.insert(lines, "..............................................................................................................................................")
len = #lines[1]

nums = {}
for n, line in ipairs(lines) do
	j = 1
	while true do
		i, j = line:find("%d+", j+1)
		if i == nil then break end
		num = line:sub(i, j)
		if not nums[n*len+i-1] then nums[n*len+i-1] = {} end table.insert(nums[n*len+i-1], num)
		if not nums[n*len+j+1] then nums[n*len+j+1] = {} end table.insert(nums[n*len+j+1], num)
		for k = i-1, j+1 do
			if not nums[(n-1)*len+k] then nums[(n-1)*len+k] = {} end table.insert(nums[(n-1)*len+k], num)
			if not nums[(n+1)*len+k] then nums[(n+1)*len+k] = {} end table.insert(nums[(n+1)*len+k], num)
		end
	end
end

sum = 0
for n, line in ipairs(lines) do
	i = 1
	while true do
		i = line:find("*", i+1)
		if i == nil then break end
		if nums[n*len+i] and #nums[n*len+i] == 2 then
			sum = sum + (nums[n*len+i][1] * nums[n*len+i][2])
		end
	end
end

print(sum)
