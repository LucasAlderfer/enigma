require './lib/key_generator.rb'
require './lib/character_map.rb'

class Encrypt
include CharacterMap
attr_reader :encryption_key, :rotations

  def initialize(key = KeyGenerator.new.key, date = Time.now)
    #still need to pass in message as well WIP
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
    #=> [["01", "8"], ["12", "3"], ["23", "2"], ["34", "4"]]
    #need to iterate over the rotations array and the current date array
    #to convert the string elements to integer elements.  If the numbers are integers we can zip them and sum the elements.
  end
end
