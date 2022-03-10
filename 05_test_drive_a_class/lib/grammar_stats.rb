class GrammarStats
  attr_accessor :checked, :passed

  def initialize
    @checked = 0.0
    @passed = 0.0
  end

  def check(text)
    @checked += 1
    valid_endings = [".", "?", "!"]
    if text[0] == text[0].upcase && valid_endings.include?(text[-1])
      @passed += 1
      true
    else
      false
    end
  end

  def percentage_good
    if @checked == 0.0
      0
    else
      (@passed / @checked * 100).to_i
    end
  end
end