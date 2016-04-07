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

end
