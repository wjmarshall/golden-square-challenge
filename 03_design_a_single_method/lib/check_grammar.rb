def check_grammar(string)
  valid_endings = [".", "!", "?"]
  if string[0] == string[0].upcase && valid_endings.include?(string[-1])
    true
  else
    false
  end
end