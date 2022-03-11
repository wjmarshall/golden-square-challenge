class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @unread = contents.split
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    words = @contents.split
    words.length
  end

  def reading_time(wpm) 
    word_count = self.count_words
    if word_count % wpm == 0
      reading_time = word_count / wpm
    else
      reading_time = word_count / wpm + 1
    end
    reading_time
  end

  def reading_chunk(wpm, minutes) 
    return nil if wpm == 0 || minutes == 0
    reading_chunk_count = wpm * minutes
    reading_chunk = @unread[0..reading_chunk_count -1]
    reading_chunk_count.times { @unread.shift }
    @unread = @contents.split if @unread.empty?    
    reading_chunk.join(" ")
  end
end