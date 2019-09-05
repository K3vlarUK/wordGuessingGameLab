require("minitest/autorun")
require("minitest/pride")
require_relative("../Player.rb")

class PlayerTest < MiniTest::Test

  def setup

    @player1 = Player.new("Kevin")

  end

  def test_player_has_name()
    assert_equal("Kevin", @player1.name())
  end

  def test_player_has_lives()
    assert_equal(6, @player1.lives())
  end

  def test_lose_life()
    assert_equal(5, @player1.lose_life())
  end

end
