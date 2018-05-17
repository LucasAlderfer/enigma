# all common encryption and decryption methods
module Crypt

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

  def actual_index
    actual_index = []
    find_new_index.map do |number|
      x = number - ((number / character_map.length) * character_map.length)
      actual_index << x
    end
    actual_index
  end
end
