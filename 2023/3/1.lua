#!/usr/bin/env lua

lines = {}
table.insert(lines, "..............................................................................................................................................")
for s in io.read("*a"):gmatch("[^\n]+") do table.insert(lines, "."..s..".") end
table.insert(lines, "..............................................................................................................................................")

sum = 0

for n, line in ipairs(lines) do
	j = 1
	while true do
		i, j = line:find("%d+", j+1)
		if i == nil then break end
		chars = line:sub(i-1, i-1)..line:sub(j+1, j+1)..lines[n-1]:sub(i-1, j+1)..lines[n+1]:sub(i-1, j+1)
		if chars:find("[^%d.]") then sum = sum + line:sub(i, j) end
	end
end

print(sum)
