class Score
  attr_reader :word

  LETTER_POINTS = {
  1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  2 => ["D", "G"],
  3 => ["B", "C", "M", "P"],
  4 => ["F", "H", "V", "W", "Y"],
  5 => ["K"],
  8 => ["J", "X"],
  10 => ["Q", "Z"]
  }

  def initialize(word)
    @word = word
  end

  ## Both score methods can probably be refactored to work with a string instead of always converting the individual words to arrays. DO THIS SOON.

  def self.score(word)
  score = 0
  tiles = 0

  word_array = word.upcase.split("")

  word_array.each do |letter|
    LETTER_POINTS.each do |points, letters_array|
      if letters_array.include? letter
        score += points
        tiles += 1
      end
    end
  end
  # if all seven tiles are used the below tenary will add 50 points to the users score else return score
  tiles == 7 ? score += 50 : score
  score
  end

  def self.score_many(multiple_word_string)
  ## for many words, the user writes their words in a textarea, and give them instructions to separate the words with a space
    multiple_words = multiple_word_string.upcase.split(" ")
    # what is this? why is this variable never used?
    split_into_letters = multiple_words.map do |word|
      word.split("")
    end

    multiple_words = multiple_word_string.split(" ")
    word_scores = multiple_words.map do |word|
      self.score(word)
    end
    word_scores.reduce(0,:+)

    # Jeremy wants me to show the individual score for each word AND the sum on the page.
  end

end
