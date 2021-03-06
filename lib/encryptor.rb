require './lib/key_generator'
require './lib/character_map'
require './lib/offset_generator'
require './lib/crypt'

class Encryptor
include CharacterMap
include Crypt
attr_reader :key, :rotations

  def initialize(message, key = KeyGenerator.new.key, date = Time.now)
    @message = message.chars
    @key = key
    @current_date = OffsetGenerator.new(date)
    @rotations = []
    make_rotations
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

  def encrypt
    encrypted_text = []
    actual_index.each do |number|
      encrypted_text << character_map[number]
    end
    encrypted_text.join
  end
end
