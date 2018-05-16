require './lib/encryptor.rb'
require 'date'

content = File.open("message.txt", "r")
input = content.read.strip
content.close

en = Encryptor.new(input)
content = File.new("encrypted.txt", "w")
content.puts(en.encrypt)
content.close
date = Time.now.strftime("%e%m%y").to_i
puts "Created #{ARGV[1]} with the key #{en.key.join} and date #{date}"
