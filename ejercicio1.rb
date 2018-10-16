a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]

b = a.map do |i| i + 1 end

c = a.map do |i| i.to_f end

d = a.map do |i| i.to_s end

e = a.reject do |i| i<5 end

f = a.select do |i| i>5 end

g = a.inject(:+)

h = a.group_by do |i| i.even? end

i = a.group_by do |i| i==6 end