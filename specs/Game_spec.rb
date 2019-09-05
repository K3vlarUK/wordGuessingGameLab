require("minitest/autorun")
require("minitest/pride")
require_relative("../Game.rb")
require_relative("../Player.rb")
require_relative("../HiddenWord.rb")

class GameTest < MiniTest::Test

  def setup
    @player1 = Player.new("Kevin")
    @hidden_word = HiddenWord.new("wheel of fortune")

    @game = Game.new(@player1, @hidden_word)
  end

  def test_game_has_player()
    assert_equal(@player1, @game.player())
  end

  def test_game_has_hidden_word()
    assert_equal(@hidden_word, @game.show_hidden_word())
  end

  def test_game_has_guess_letters()
    assert_equal(0, @game.check_guessed_letters())
  end

  def test_guess_letter()
    @game.guess_letter("e")
    @game.guess_letter("F")
    assert_equal(2, @game.check_guessed_letters())
    assert_equal(["e", "f"], @game.guessed_letters())
  end

  def test_incorrect_guess()
    @game.guess_letter("z")
    assert_equal(5, @player1.lives())
    assert_equal(["z"], @game.guessed_letters())
  end

end
