require './test/test_helper.rb'
require './lib/encryptor.rb'

class EncryptorTest < Minitest::Test

  def test_it_exists
    e = Encryptor.new("a")
    assert_instance_of Encryptor, e
  end

  def test_it_has_a_key
    e = Encryptor.new("a","01234")
    assert_equal "01234", e.key
  end

  def test_can_generate_its_own_key
    e = Encryptor.new("a","01234")
    assert_equal 4, e.rotations.length
    assert_equal 2, e.rotations[0].length
    assert_equal 2, e.rotations[3].length
  end

  def test_it_can_combine_elements_from_key_array
    e = Encryptor.new("a","01234")
    assert_equal 5, e.key.length
    assert_equal "01", e.rotations[0]
    assert_equal "12", e.rotations[1]
    assert_equal "23", e.rotations[2]
    assert_equal "34", e.rotations[3]
  end

  def test_can_make_rotations
    e = Encryptor.new("a","01234")
    assert_equal ['01','12','23','34'], e.rotations
  end

  def test_it_can_can_calculate_shift_keys
    e = Encryptor.new("..end..","12345", Time.new(2018,05,14))
    assert_equal 4, e.calculate_shift_keys.length
    assert_equal 20, e.calculate_shift_keys[0]
    assert_equal 26, e.calculate_shift_keys[1]
    assert_equal 36, e.calculate_shift_keys[2]
    assert_equal 49, e.calculate_shift_keys[3]
  end

  def test_it_has_a_character_map
    e = Encryptor.new("a")
    assert_equal 39, e.character_map.length
  end

  def test_it_can_calculate_actual_shifts
    e = Encryptor.new("abz", "89768")
    assert_equal [19, 22, 0, 33], e.actual_shift
  end

  def test_it_can_encrypt_a_character
    e = Encryptor.new("abz","89768", Time.new(2018,05,14))
    assert_equal [0, 1, 25], e.current_index
  end

  def test_it_can_find_new_index
    e = Encryptor.new("abz","89768", Time.new(2018,05,14))
    assert_equal [19, 23, 25], e.find_new_index
  end

  def test_it_can_encrypt_three_letters
    e = Encryptor.new("abz","89768", Time.new(2018,05,14))
    assert_equal 'txz', e.encrypt
  end

  def test_it_can_encrypt_multiple_words
    e = Encryptor.new("this is a test","89768", Time.new(2018,05,14))
    assert_equal [38, 29, 8, 12, 16, 30, 18, 30, 19, 19, 19, 37, 37, 2], e.actual_index
  end

  def test_it_can_encrypt_total_number_characters
    e = Encryptor.new("this is so secret ..end..")
    assert_equal 25, e.encrypt.length
  end

  def test_it_can_encrypt
    e = Encryptor.new("this is a test","89768", Time.new(2018,05,14))
    assert_equal ",3imq4s4ttt..c", e.encrypt
  end
end
