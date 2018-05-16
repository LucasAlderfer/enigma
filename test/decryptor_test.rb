require './test/test_helper.rb'
require './lib/decryptor.rb'

class DecryptorTest < Minitest::Test

  def test_it_exists
    d = Decryptor.new("a", "34532")
    assert_instance_of Decryptor, d
  end

  def test_it_can_decrypt
    d = Decryptor.new(",3imq4s4ttt..c","89768", Time.new(2018,05,14))
    assert_equal "this is a test", d.decrypt
  end
end
