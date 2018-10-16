nombres = ["Violeta", "Andino", "Clemente", "Javiera", "Paula", "Pia", "Ray"]

n_5 = nombres.select do |i| i.length > 5 end

min = n_5.map do |i| i.downcase end

n_p = nombres.select do |i| i[0] == "P" end

ncant = nombres.map do |i| i.length end

n_sub = nombres.map do |i| i.gsub(/[aeiou]/,"") end

puts n_sub