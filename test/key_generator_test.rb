require './test/test_helper.rb'
require './lib/key_generator.rb'

class KeyGeneratorTest < Minitest::Test

  def test_it_exists
    k = KeyGenerator.new
    assert_instance_of KeyGenerator, k
  end

  def test_it_has_generates_a_number
    k = KeyGenerator.new
    assert_instance_of Array, k.key
  end

  def test_it_has_5_digits
    k = KeyGenerator.new
    assert_equal 5, k.key.length
  end

  def test_it_can_combine_elements_from_key_array
    k = KeyGenerator.new(["0","1","2","3","4"])
    assert_equal 5, k.key.length
    assert_equal "01", k.rotations[0]
    assert_equal "12", k.rotations[1]
    assert_equal "23", k.rotations[2]
    assert_equal "34", k.rotations[3]
  end

  def test_can_group_rotations
    k = KeyGenerator.new(["0","1","2","3","4"])
    assert_equal ['01','12','23','34'], k.rotations
  end

  def test_can_generate_its_own_key
    k = KeyGenerator.new
    assert_equal 4, k.rotations.length
    assert_equal 2, k.rotations[0].length
    assert_equal 2, k.rotations[3].length
  end

end
