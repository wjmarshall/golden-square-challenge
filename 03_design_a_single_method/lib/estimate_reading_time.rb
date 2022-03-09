def estimate_reading_time(word_count)
  if word_count.negative?
    fail "Error: word count must be a positive number"
  elsif word_count % 200 == 0
    reading_time = word_count / 200
  else
    reading_time = word_count / 200 + 1
  end
  "Approximately #{reading_time} minute(s)"
end