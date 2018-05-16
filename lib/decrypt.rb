require './lib/decryptor.rb'
require 'date'

content = File.open("encrypted.txt", "r")
input = content.read.strip
content.close

content = File.new("decrypted.txt", "w")
  date = ARGV[3]
  date = date.to_s.chars
  month = date[2] + date[3]
  day = date[0] + date[1]
  year = "20" + date[4] + date[5]

de = Decryptor.new(input, ARGV[2], Time.new(year.to_i, month.to_i, day.to_i))
content.puts(de.decrypt)
content.close

puts "Created #{ARGV[1]} with the key #{de.key} and date #{ARGV[3]}"
