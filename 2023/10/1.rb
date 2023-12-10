#!/usr/bin/env ruby

map = []
x, y = nil, -1
while line = gets
  map.append line
  if !x; x, y = line.index('S'), y + 1 end
end

if    "|F7".index(map[y-1][x]); dir = 'u'
elsif "|LJ".index(map[y+1][x]); dir = 'd'
elsif "-LF".index(map[y][x-1]); dir = 'l'
elsif "-J7".index(map[y][x+1]); dir = 'r'
end

len = 0
loop do
  len += 1
  case dir
  when 'u'; case map[y-=1][x] when 'F'; dir = 'r' when '7'; dir = 'l' end
  when 'd'; case map[y+=1][x] when 'L'; dir = 'r' when 'J'; dir = 'l' end
  when 'l'; case map[y][x-=1] when 'L'; dir = 'u' when 'F'; dir = 'd' end
  when 'r'; case map[y][x+=1] when 'J'; dir = 'u' when '7'; dir = 'd' end
  end
  if map[y][x] == 'S'; break; end
end

puts (len / 2)
