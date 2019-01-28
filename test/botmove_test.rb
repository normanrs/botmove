require 'minitest/autorun'
require 'minitest/pride'
require './lib/botmove.rb'

class BotmoveTest <  Minitest::Test
  def test_it_exists
    bot = Botmove.new
    assert_instance_of Botmove, bot
  end

  def test_it_starts_at_00
    bot = Botmove.new
    actual = bot.coords
    assert_equal [0,0], actual
  end

  def test_rto_movement
    bot = Botmove.new
    bot.returns_to_origin('l')
    actual = bot.dir
    assert_equal ['r', 'f', 'l', 'b'], actual
  end

end
