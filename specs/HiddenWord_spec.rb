require("minitest/autorun")
require("minitest/pride")
require_relative("../HiddenWord.rb")
require_relative("../Player.rb")
require_relative("../Game.rb")

class HiddenWordTest < MiniTest::Test

  def setup
    @player1 = Player.new("Kevin")
    @hidden_word = HiddenWord.new("wheel of fortune")

    @game = Game.new(@player1, @hidden_word)
  end

  def test_hidden_word_has_word()
    assert_equal("wheel of fortune", @hidden_word.get_word())
  end

  def test_word_is_obscured()
    test = @hidden_word.obscure_word()
    assert_equal("***** ** *******", test)
  end

  def test_guessed_letter_exists__true()
    assert_equal(true, @hidden_word.letter_exists("e"))
  end

  def test_guessed_letter_exists__false()
    assert_equal(false, @hidden_word.letter_exists("z"))
  end

  def test_correct_guess_reveal_letter()
    @hidden_word.obscure_word()
    assert_equal("**ee* ** ******e", @hidden_word.reveal_letter("e"))
  end

end
