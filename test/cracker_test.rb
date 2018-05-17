require './test/test_helper'
require './lib/cracker'

class CrackerTest < Minitest::Test

  def test_it_exists
    c = Cracker.new("hn3mmnx")
    assert_instance_of Cracker, c
  end

  def test_correct_key_output
    c = Cracker.new("hn3mmnx")
    assert_instance_of String, c.crack_key
    assert_equal 5, c.crack_key.length
  end
end
