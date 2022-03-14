class Diary
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def select_entry(wpm, minutes)
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

  def list_contacts
    phone_numbers = []
    @entries.each { |entry| phone_numbers << entry.phone_numbers }
    phone_numbers.flatten
  end

end