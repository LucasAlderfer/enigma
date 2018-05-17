require './test/test_helper'
require './lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_it_exists
    d = Decryptor.new('a', "34532")
    assert_instance_of Decryptor, d
  end

  def test_it_can_find_new_index
    d = Decryptor.new(',3imq4s4ttt..c','89768', Time.new(2018,05,14))
    result = [19, 7, 8, -21, -3, 8, 18, -3, 0, -3, 19, 4, 18, -20]
    assert_equal result, d.find_new_index
  end

  def test_it_can_decrypt
    d = Decryptor.new(',3imq4s4ttt..c','89768', Time.new(2018,05,14))
    assert_equal 'this is a test', d.decrypt
  end
end

# see encryptor_test for all crypt module methods
