require './lib/cracker'
require 'date'

content = File.open('encrypted.txt', 'r')
input = content.read.strip
content.close

content = File.new('cracked.txt', 'w')
date = ARGV[2]
date = date.to_s.chars
month = date[2] + date[3]
day = date[0] + date[1]
year = '20' + date[4] + date[5]

cr = Cracker.new(input, Time.new(year.to_i, month.to_i, day.to_i))
key = cr.crack_key

de = Decryptor.new(input, key, Time.new(year.to_i, month.to_i, day.to_i))
content.puts(de.decrypt)
content.close

puts "Created #{ARGV[1]} with cracked key #{de.key} and date #{ARGV[2]}"
