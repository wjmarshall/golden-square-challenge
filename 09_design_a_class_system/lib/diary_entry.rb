class DiaryEntry
  attr_reader :title, :contents, :phone_numbers

  def initialize(title, contents)
    @title = title
    @contents = contents
    @phone_numbers = @contents.scan(/07\d{9}/)
  end

  def count_words
    words = @contents.split
    words.length
  end

  def reading_time(wpm) 
    word_count = count_words
    if word_count % wpm == 0
      reading_time = word_count / wpm
    else
      reading_time = word_count / wpm + 1
    end
    reading_time
  end
end