class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    total_count = 0
    @entries.each do |entry|
      count = entry.count_words
      total_count += count
    end
    total_count
  end

  def reading_time(wpm) 
    fail "Error: Invalid wpm" if wpm < 1
    total_reading_time = 0
    @entries.each do |entry|
      entry_reading_time = entry.reading_time(wpm)
      total_reading_time += entry_reading_time
    end
    total_reading_time
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    reading_times = {}
    @entries.each do |entry|
      reading_times[entry] = entry.reading_time(wpm)
    end
    short_enough = reading_times.select do |entry, reading_time|
      reading_time <= minutes
    end
    closest = short_enough.max_by { |entry, reading_time| reading_time }
    closest[0]
  end
end