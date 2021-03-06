require './test/test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_it_exists
    k = KeyGenerator.new
    assert_instance_of KeyGenerator, k
  end

  def test_it_generates_a_number
    k = KeyGenerator.new
    assert_equal Integer, k.key[0].to_i.class
  end

  def test_it_has_5_digits
    k = KeyGenerator.new
    assert_equal 5, k.key.length
  end
end
