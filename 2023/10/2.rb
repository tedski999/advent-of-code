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

sdir = dir
loop do
  case dir
  when 'u'; case map[y-=1][x] when 'F'; dir = 'r' when '7'; dir = 'l' end
  when 'd'; case map[y+=1][x] when 'L'; dir = 'r' when 'J'; dir = 'l' end
  when 'l'; case map[y][x-=1] when 'L'; dir = 'u' when 'F'; dir = 'd' end
  when 'r'; case map[y][x+=1] when 'J'; dir = 'u' when '7'; dir = 'd' end
  end
  case map[y][x]
  when '-'; map[y][x] = '~'
  when '|'; map[y][x] = 'i'
  when 'L'; map[y][x] = 'l'
  when 'F'; map[y][x] = 'f'
  when '7'; map[y][x] = '&'
  when 'J'; map[y][x] = 'j'
  when 'S'
    case sdir+dir
    when 'll','rr'; map[y][x] = '~'
    when 'uu','dd'; map[y][x] = 'i'
    when 'rd','ul'; map[y][x] = 'l'
    when 'ru','dl'; map[y][x] = 'f'
    when 'lu','dr'; map[y][x] = '&'
    when 'ld','ur'; map[y][x] = 'j'
    end
    break
  end
end

len = 0
for line in map
  o, d = false, nil
  line.each_char { |char|
    case char
    when '~'; o = o
    when 'i'; o = !o
    when 'l'; d = true
    when 'f'; d = false
    when '&'; o = o ^ d
    when 'j'; o = o ^ !d
    else; len += o ? 1 : 0
    end
  }
end

puts len
