require './test/test_helper.rb'
require './lib/offset_generator.rb'

class OffsetGeneratorTest < Minitest::Test
  def test_it_exists
    og = OffsetGenerator.new
    assert_instance_of OffsetGenerator, og
  end

  def test_it_formats_time
    og = OffsetGenerator.new(Time.now)
    assert_instance_of Integer, og.date
    assert_equal 120518, og.date
  end



end
