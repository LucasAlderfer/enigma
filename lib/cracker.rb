require './lib/key_generator.rb'
require './lib/character_map.rb'
require './lib/offset_generator.rb'
require './lib/decryptor.rb'
require 'pry'

class Cracker
  attr_reader :message, :current_date
include CharacterMap

  def initialize(message, date = Time.now)
    @message = message
    @date = date
    @key = "00000"
  end

  def crack_key
    d = Decryptor.new(@message, @key, @date)
    until d.decrypt[-7..-1] == "..end.."
      @key = (@key.to_i + 1).to_s.rjust(5, "0")
      d = Decryptor.new(@message, @key, @date)
    end
    @key
  end
end
