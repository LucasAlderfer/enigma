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

end
