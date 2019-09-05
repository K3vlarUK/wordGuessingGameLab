class HiddenWord

  def initialize(word)
    @word = word
  end

  def get_word()
    return @word
  end

  def obscure_word()
    @word.tr("^ ", "*") # frm_str > to_str - From Stk Ovrflw
  end

  def letter_exists(guessed_letter)
    if @word.include?(guessed_letter.downcase())
      return true
    else
      return false
    end
  end

  def reveal_letter(guessed_letter)
    if letter_exists(guessed_letter)
      @word.tr!("^ #{guessed_letter}", "*")
    else
      return "Incorrect Guess"
    end
  end

end
