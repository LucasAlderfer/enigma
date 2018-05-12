require './lib/key_generator.rb'

class Encrypt
attr_reader :encryption_key, :rotations

  def initialize(key = KeyGenerator.new.key)
    @encryption_key = key
    @rotations = []
    make_rotations
  end

  def make_rotations
    index = 0
    4.times do
      @rotations << (@encryption_key[index] + @encryption_key[index + 1])
      index += 1
    end
  end

end
