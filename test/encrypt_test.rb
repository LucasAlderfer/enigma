require './test/test_helper.rb'
require './lib/encrypt.rb'
require './lib/key_generator.rb'
require './lib/offset_generator.rb'

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

end
