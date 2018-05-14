class OffsetGenerator
  attr_reader :date
  def initialize(date = Time.now)
      @date = date.strftime("%e%m%y").to_i.to_a
  end
end
