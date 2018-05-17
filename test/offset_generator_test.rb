require './test/test_helper'
require './lib/offset_generator'

class OffsetGeneratorTest < Minitest::Test
  def test_it_exists
    og = OffsetGenerator.new
    assert_instance_of OffsetGenerator, og
  end

  def test_it_formats_time
    t = Time.new(2007,11,19)
    og = OffsetGenerator.new(t)
    assert_instance_of Integer, og.date
    assert_equal 191107, og.date
  end

  def test_it_can_square_the_date
    t = Time.new(2007,11,19)
    og = OffsetGenerator.new(t)
    assert_equal '36521885449', og.date_squared
  end

  def test_it_can_extract_last_four_dig_of_date_squared
    t = Time.new(2007,11,19)
    og = OffsetGenerator.new(t)
    result = %w[5 4 4 9]
    assert_equal result, og.extract_offset
  end
end
