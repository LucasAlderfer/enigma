require './lib/encryptor'
require './lib/decryptor'
require './lib/cracker'
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

  def crack(message, date = Time.now)
    cr = Cracker.new(message, date)
    key = cr.crack_key
    de = Decryptor.new(message, key, date)
    p de.decrypt
  end
end
