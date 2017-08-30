class Scrabble

  def score(word)
    return 0 if word.nil?

    ones = [1] * word.length
    score_with_multipliers(word, ones)
  end

  def score_with_multipliers(word, letter_multipliers, word_multiplier = 1)
    total = 0
    return total if word.nil?

    word.each_char do |char|
      letter_multiplier = letter_multipliers[word.index(char)]
      total += point_values[char.upcase] * letter_multiplier
    end

    total += 10 if word.length >= 7
    total * word_multiplier
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
