gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_score_can_score_a_single_upper_case_letter
    assert_equal 1, Scrabble.new.score("A")
    assert_equal 4, Scrabble.new.score("F")
  end

  def test_score_can_score_a_word_of_mixed_case
    assert_equal 5, Scrabble.new.score("Dog")
    assert_equal 5, Scrabble.new.score("Cat")
  end

  def test_score_can_score_an_empty_string
    assert_equal 0, Scrabble.new.score("")
  end

  def test_score_can_score_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_score_with_multipliers_can_apply_letter_multiplier_to_single_letter
    board = Scrabble.new

    assert_equal 2, board.score_with_multipliers("a", [2])
    assert_equal 12, board.score_with_multipliers("f", [3])
  end

  def test_score_with_multipliers_can_apply_letter_multipliers_to_a_word_of_mixed_case
    board = Scrabble.new

    assert_equal 10, board.score_with_multipliers("Dog", [1, 2, 3])
    assert_equal 6, board.score_with_multipliers("Cat", [1, 2, 1])
  end

  def test_score_with_multipliers_can_apply_word_multiplier_to_single_letter
    board = Scrabble.new

    assert_equal 2, board.score_with_multipliers("a", [1], 2)
    assert_equal 12, board.score_with_multipliers("f", [1], 3)
  end

  def test_score_with_multipliers_can_apply_word_multiplier_to_a_word_of_mixed_case
    board = Scrabble.new

    assert_equal 10, board.score_with_multipliers("Dog", [1, 1, 1], 2)
    assert_equal 15, board.score_with_multipliers("Cat", [1, 1, 1], 3)
  end

  def test_score_with_multipliers_can_apply_word_multiplier_to_single_letter
    board = Scrabble.new

    assert_equal 4, board.score_with_multipliers("a", [2], 2)
    assert_equal 24, board.score_with_multipliers("f", [2], 3)
  end

  def test_score_with_multipliers_can_apply_word_multiplier_to_a_word_of_mixed_case
    board = Scrabble.new

    assert_equal 20, board.score_with_multipliers("Dog", [1, 2, 3], 2)
    assert_equal 18, board.score_with_multipliers("Cat", [1, 2, 1], 3)
  end

  def test_score_adds_10_for_words_with_more_than_6_letters
    board = Scrabble.new

    assert_equal 19, board.score('bananas')
  end

  def test_score_with_multipliers_can_also_add_10_for_words_with_more_than_6_letters
    board = Scrabble.new
    expected = 62
    actual = board.score_with_multipliers('bananas', [1, 3, 3, 3, 3, 3, 3], 2)

    assert_equal expected, actual
  end

end
