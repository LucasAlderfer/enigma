class OffsetGenerator
  attr_reader :date
  def initialize(date = Time.now)
      @date = date.strftime("%e%m%y").to_i
  end
end
