def make_snippet(string)
  words = string.split(" ")
  if words.length <= 5
    return string
  else
    first_five = words[0..4]
    return first_five.join(" ") + "..."
  end
end

