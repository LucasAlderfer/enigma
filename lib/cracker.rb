require './lib/key_generator.rb'
require './lib/character_map.rb'
require './lib/offset_generator.rb'
require 'pry'

class Cracker
include CharacterMap

  def initialize(message, date = Time.now)
    @message = message.chars
    @current_date = OffsetGenerator.new(date)
  end

  def isolate_quad
    last_four = @message[-4..-1]
  end

  def quad_index
    shift_keys = []
    isolate_quad.each do |character|
      index = character_map.index(character)
      shift_keys << index
    end
    shift_keys
  end

  def offsets_to_integers
    @current_date.extract_offset.map do |string|
      string.to_i
    end
  end

  def calculate_rotations
    rotations = []
    index = 0
    until index == 4
      rotations << quad_index[index] - offsets_to_integers[index]
      index += 1
    end
    rotations
  end
end
