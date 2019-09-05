class HiddenWord

  def initialize(word)
    @hidden_word = word
  end

  def get_hidden_word()
    return @hidden_word
  end

  def display_word(guesses = [])
    hide_letters = "^ "
    for letter in guesses
      hide_letters += letter.downcase()
      hide_letters += letter.upcase()
    end

    return @hidden_word.tr(hide_letters , "*") # frm_str > to_str - From Stk Ovrflw
  end

  def letter_exists(guessed_letter)
    if @hidden_word.include?(guessed_letter)
      return true
    else
      return false
    end
  end

  # def reveal_letter(guessed_letter)
  #   if letter_exists(guessed_letter)
  #     @display_word.tr!("^ #{guessed_letter}", "*")
  #   else
  #     return nil
  #   end
  # end

end
