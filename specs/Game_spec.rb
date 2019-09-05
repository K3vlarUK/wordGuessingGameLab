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

  def test_game_has_guess_letters__empty()
    assert_equal(0, @game.check_guessed_letters())
  end

  def test_game_has_guess_letters__letters()
    @game.guess_letter('w')
    @game.guess_letter('e')
    assert_equal(2, @game.check_guessed_letters())
  end

  def test_correct_guesses()
    @game.guess_letter('w')
    @game.guess_letter('h')
    @game.guess_letter('e')
    @game.guess_letter('l')
    assert_equal(false, @game.is_won)
    @game.guess_letter('o')
    @game.guess_letter('f')
    @game.guess_letter('r')
    @game.guess_letter('t')
    @game.guess_letter('u')
    @game.guess_letter('n')
    assert_equal(true, @game.is_won)
  end

  def test_incorrect_guess()
    @game.guess_letter("z")
    @game.guess_letter("y")
    @game.guess_letter("5")
    @game.guess_letter("d")
    @game.guess_letter("g")
    assert_equal(false, @game.is_lost())
    @game.guess_letter("b")
    assert_equal(true, @game.is_lost())
  end

end
