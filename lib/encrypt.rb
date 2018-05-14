require './lib/key_generator.rb'
require './lib/character_map.rb'
require 'pry'

class Encrypt
include CharacterMap
attr_reader :encryption_key, :rotations

  def initialize(key = KeyGenerator.new.key, date = Time.now)
    @encryption_key = key
    @current_date = OffsetGenerator.new(date)
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

  def calculate_shift_keys
    merge_key_with_offset = @rotations.zip(@current_date.extract_offset)
    integer_array = merge_key_with_offset.map do |sub_array|
      sub_array.map do |string|
        string.to_i
      end
    end
    integer_array.map do |numbers|
      numbers.sum
    end
  end
end
