class Game

  attr_reader :player, :guessed_letters

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def show_hidden_word()
    return @hidden_word
  end

  def check_guessed_letters()
    @guessed_letters.length()
  end

  def guess_letter(letter, hidden_word, player)
    if hidden_word.letter_exists(letter)
      hidden_word.reveal_letter(letter)
    else
      player.lose_life()
    end
    @guessed_letters.push(letter.downcase())
  end

end
