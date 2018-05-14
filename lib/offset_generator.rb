class OffsetGenerator
  attr_reader :date

  def initialize(date = Time.now)
    @date = date.strftime("%e%m%y").to_i
  end

  def date_squared
    (@date ** 2).to_s
  end

  def extract_offset
    date_squared.split('')[-4..-1]
  end
end
