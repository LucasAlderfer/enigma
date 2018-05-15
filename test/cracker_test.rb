require './test/test_helper'
require './lib/cracker.rb'

class CrackerTest < Minitest::Test

  def test_it_exists
    c = Cracker.new("c7hy.")
    assert_instance_of Cracker, c
  end

  def test_isolate_quad_works
    c = Cracker.new("c7hy.")
    assert_equal Array, c.isolate_quad.class
    assert_equal 4, c.isolate_quad.length
  end

  def test_find_quad_character_map_index
    c = Cracker.new("c7hy.")
    assert_equal [33, 7, 24, 37], c.quad_index
  end

  def test_calculate_rotations
    c = Cracker.new("c7hy.", Time.new(2018,05,14))
    assert_equal [25, 4, 22, 33], c.calculate_rotations
  end



end
