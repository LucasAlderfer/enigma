require './lib/key_generator.rb'
require './lib/character_map.rb'
require 'pry'

class Encryptor
include CharacterMap
attr_reader :encryption_key, :rotations

  def initialize(message, key = KeyGenerator.new.key, date = Time.now)
    @message = message.chars
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

  def encrypt
    output = []
    shift_keys = calculate_shift_keys
    @message.each_with_index do |character, index|
      new_index = character_map.index(character) + shift_keys[0]
      new_index = (new_index % 38) - 1 if new_index > 38
        shifted_character = character_map[new_index]
        output << shifted_character
        shift_keys.rotate!
    end
    output.join
  end

end
