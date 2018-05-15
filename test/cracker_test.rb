require './test/test_helper'
require './lib/cracker.rb'

class CrackerTest < Minitest::Test

  def test_it_exists
    c = Cracker.new("hn3mmnx")
    assert_instance_of Cracker, c
  end

  def test_it_has_attributes
    c = Cracker.new("hn3mmnx", Time.new(2018,05,15))
    assert_equal ['h', 'n', '3', 'm', 'm', 'n', 'x'], c.message
    assert_equal 150518, c.current_date.date
  end



end
