class Game

  attr_reader :player, :guessed_letters, :is_won, :is_lost

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
    @is_won = false
    @is_lost = false
  end

  def show_hidden_word()
    return @hidden_word
  end

  def check_guessed_letters()
    @guessed_letters.length()
  end


  def guess_letter(letter)
    if !@guessed_letters.include?(letter)
      @guessed_letters.push(letter)

      letter_is_there = @hidden_word.letter_exists(letter)

      if letter_is_there

        @is_won = have_you_won?()

      else !letter_is_there
        @player.lose_life()
        if @player.lives() <= 0
          game_over()
        end
      end
    end
  end

  def game_over()
    @is_lost = true
  end

  def have_you_won?()
    obscured_word = @hidden_word.display_word(@guessed_letters)
    if !obscured_word.include?("*")
      return true
    else
      return false
    end

  end

end
