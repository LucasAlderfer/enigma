class KeyGenerator
  attr_reader :key

  def initialize(key = [])
    @key = key
    generate_key if key.empty?
  end

  def generate_key
    numbers = ['0','1','2','3','4','5','6','7','8','9']
    5.times do
      @key << numbers.shuffle.pop
    end
  end
end
