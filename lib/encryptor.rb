require './lib/key_generator.rb'
require './lib/character_map.rb'
require './lib/offset_generator.rb'

class Encryptor
include CharacterMap
attr_reader :key, :rotations

  def initialize(message, key = KeyGenerator.new.key, date = Time.now)
    @message = message.chars
    @key = key
    @current_date = OffsetGenerator.new(date)
    @rotations = []
    make_rotations
  end

  def make_rotations
    index = 0
    4.times do
      @rotations << (@key[index] + @key[index + 1])
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

  def actual_shift
    formatted_shift = []
    calculate_shift_keys.each do |number|
      x = number - ((number / character_map.length) * character_map.length)
      formatted_shift << x
    end
    formatted_shift
  end

  def current_index
    current_index = []
    @message.map do |letter|
    current_index << character_map.index(letter)
    end
    current_index
  end

  def find_new_index
    actual = actual_shift
    new_index = []
    current_index.map do |number|
      new_index << number + actual[0]
      actual.rotate!
    end
    new_index
  end

  def actual_index
    actual_index = []
    find_new_index.map do |number|
      x = number - ((number / character_map.length) * character_map.length)
      actual_index << x
    end
    actual_index
  end

  def encrypt
    encrypted_text = []
    actual_index.each do |number|
      encrypted_text << character_map[number]
    end
    encrypted_text.join
  end
end
