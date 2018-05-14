require './test/test_helper.rb'
require './lib/encrypt.rb'
require './lib/key_generator.rb'
require './lib/offset_generator.rb'
require './lib/character_map'

class EncryptTest < Minitest::Test

  def test_it_exists
    e = Encrypt.new
    assert_instance_of Encrypt, e
  end

  def test_it_has_a_key
    e = Encrypt.new("01234")
    assert_equal "01234", e.encryption_key
  end

  def test_it_can_combine_elements_from_key_array
    e = Encrypt.new("01234")
    assert_equal 5, e.encryption_key.length
    assert_equal "01", e.rotations[0]
    assert_equal "12", e.rotations[1]
    assert_equal "23", e.rotations[2]
    assert_equal "34", e.rotations[3]
  end

  def test_can_group_rotations
    e = Encrypt.new("01234")
    assert_equal ['01','12','23','34'], e.rotations
  end

  def test_can_generate_its_own_key
   e = Encrypt.new("01234")
   assert_equal 4, e.rotations.length
   assert_equal 2, e.rotations[0].length
   assert_equal 2, e.rotations[3].length
  end

  def test_it_can_can_calculate_shift_keys
    e = Encrypt.new("01234", Time.new(2018,05,14))
    assert_equal 4, e.calculate_shift_keys.length
    assert_equal 9, e.calculate_shift_keys[0]
    assert_equal 15, e.calculate_shift_keys[1]
    assert_equal 25, e.calculate_shift_keys[2]
    assert_equal 38, e.calculate_shift_keys[3]
  end

  def test_it_has_a_character_map
    e = Encrypt.new
    assert_equal 39, e.character_map.length
  end

end
