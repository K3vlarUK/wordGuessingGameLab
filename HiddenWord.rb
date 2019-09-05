class HiddenWord

  def initialize(word)
    @hidden_word = word
    @display_word = ""
  end

  def get_word()
    return @hidden_word
  end

  def obscure_word()
    @display_word = @hidden_word
    @display_word.tr("^ ", "*") # frm_str > to_str - From Stk Ovrflw
  end

  def letter_exists(guessed_letter)
    if @hidden_word.include?(guessed_letter.downcase())
      return true
    else
      return false
    end
  end

  def reveal_letter(guessed_letter)
    if letter_exists(guessed_letter)
      @display_word.tr!("^ #{guessed_letter}", "*")
    else
      return nil
    end
  end

end
