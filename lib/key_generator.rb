require 'pry'

class KeyGenerator
  attr_reader :key,
              :rotations
  def initialize(key = [])
    @key = key
    @rotations = []
    make_rotations if key.empty? == false
    generate_key if key.empty?
  end

  def generate_key
    numbers = ['0','1','2','3','4','5','6','7','8','9']
    5.times do
      @key << numbers.shuffle.pop
    end
    make_rotations
  end

  def make_rotations
    index = 0
    4.times do
      @rotations << (@key[index] + @key[index + 1])
      index += 1
    end
  end
end
