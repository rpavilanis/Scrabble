require_relative "../module"
require_relative "../lib/Scoring"

class Scrabble::Player

  attr_reader :name
  
  def initialize(name)
    @name = name
    @word_score = 0
    @total_score = 0
    @words_by_player = []

  end

  def plays
    # returns Array of words played by player: # words_by_player = []
    return @words_by_player
  end

  def play(word)
    #play(word): Adds the input word to the plays Array:words_by_player
    # if score, returns false if player has already won

    if @total_score > 100
      return false
    end
    @words_by_player << word
    # Returns the score of the word: @word_score
    @word_score = Scrabble::Scoring.score(word)
    return @word_score
  end

  def total_score
    # Returns the sum of scores of played words: @total_score
    @words_by_player.each do |word|
       @total_score += Scrabble::Scoring.score(word)
    end
    return @total_score
  end

  def won?
    # If the player has over 100 points, returns true, otherwise returns false: if statement, total_score >= 100 return true else return false
    if @total_score >= 100
      return true
    else
      return false
    end
  end

  def highest_scoring_word
    # Returns the highest scoring played word
    return Scrabble::Scoring.highest_score_from(@words_by_player)
  end

  def highest_word_score
    # Returns the highest_scoring_word score
    # include?? highest_score_from but also return max_scoring_word somehow??
    # proudest moment for Rachel lol
    high_score_word = highest_scoring_word
    highest_score = Scrabble::Scoring.score(high_score_word)
    return highest_score

  end

# additonal wave 3 requirement:
  def tiles
# a collection of letters that they player can play. At (max: 7).

  end
  def draw_tiles(tilebag)
# fills the tile tile array until it has 7 letters from the given tile bag.

  end


end




# player1 = Scrabble::Player.new("Joe")
# puts player1.play("cats")
# #=> ["cats"] 6

# same length, same score.
# player1 = Scrabble::Scoring.total_score([["sizzles", "fuzz", "dog", "cat"])
# #
# #
# puts player1.total_score
