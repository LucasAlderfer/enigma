require './lib/encryptor.rb'
require './lib/decryptor.rb'
require 'date'
class Enigma

  def encrypt(message, key = KeyGenerator.new.key, date = Time.now)
    en = Encryptor.new(message, key, date)
    p en.encrypt
  end

  def decrypt(message, key = KeyGenerator.new.key, date = Time.now)
    de = Decryptor.new(message, key, date)
    p de.decrypt
  end

  def crack
  end
end
