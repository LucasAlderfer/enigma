require './test/test_helper.rb'
require './lib/decryptor.rb'
require './lib/key_generator.rb'
require './lib/offset_generator.rb'
require './lib/character_map'

class DecryptorTest < Minitest::Test

  def test_it_exists
    d = Decryptor.new("a","01234")
    assert_instance_of Decryptor, d
  end

  def test_it_has_a_key
    d = Decryptor.new("a","01234")
    assert_equal "01234", d.encryption_key
  end

  def test_it_can_combine_elements_from_key_array
    d = Decryptor.new("a","01234")
    assert_equal 5, d.encryption_key.length
    assert_equal "01", d.rotations[0]
    assert_equal "12", d.rotations[1]
    assert_equal "23", d.rotations[2]
    assert_equal "34", d.rotations[3]
  end

  def test_can_group_rotations
    d = Decryptor.new("a","01234")
    assert_equal ['01','12','23','34'], d.rotations
  end

  def test_can_generate_its_own_key
    d = Decryptor.new("a","01234")
    assert_equal 4, d.rotations.length
    assert_equal 2, d.rotations[0].length
    assert_equal 2, d.rotations[3].length
  end

  def test_it_can_can_calculate_shift_keys
    d = Decryptor.new("a","01234", Time.new(2018,05,14))
    assert_equal 4, d.calculate_shift_keys.length
    assert_equal 9, d.calculate_shift_keys[0]
    assert_equal 15, d.calculate_shift_keys[1]
    assert_equal 25, d.calculate_shift_keys[2]
    assert_equal 38, d.calculate_shift_keys[3]
  end

  def test_it_has_a_character_map
    d = Decryptor.new("a","01234")
    assert_equal 39, d.character_map.length
  end

  def test_it_can_decrypt_a_character
    d = Decryptor.new("v2a","01234", Time.new(2018,05,14))
    assert_equal "mno", d.decrypt
  end

  def test_it_can_decrypt_a_whole_message
    d = Decryptor.new("ywamnm0nx869w9.an6w0","01234", Time.new(2018,05,14))
    assert_equal "phone booth number 1", d.decrypt
  end

end
