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

  def test_rto_rotate
    bot = Botmove.new
    bot.returns_to_origin('lll')
    actual = bot.dir
    assert_equal [:r, :f, :l, :b], actual
  end

  def test_rto_move
    bot = Botmove.new
    bot.returns_to_origin('lg')
    actual = bot.coords
    assert_equal [0, -1], actual
  end

  def test_rto_move_more
    bot = Botmove.new
    bot.returns_to_origin('glglglg')
    actual = bot.coords
    assert_equal [0, 0], actual
  end

  def test_implement1
    bot = Botmove.new
    actual = bot.returns_to_origin('GRGRGRG')
    assert_equal true, actual
  end

  def test_implement2
    bot = Botmove.new
    actual = bot.returns_to_origin('GRGRLL')
    assert_equal false, actual
  end

  def test_implement3
    bot = Botmove.new
    actual = bot.returns_to_origin('GRGGRGGRGRGLG')
    assert_equal true, actual
  end

  def test_implement4
    bot = Botmove.new
    actual = bot.returns_to_origin('GRGRGGLGRGRGRG')
    assert_equal false, actual
  end

end
