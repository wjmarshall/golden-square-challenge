class DiaryEntry
  attr_accessor :unread

  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @unread = @contents.split
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

    # `wpm` is an integer representing the number
    # of words the user can read per minute
    # `minutes` is an integer representing the
    # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.