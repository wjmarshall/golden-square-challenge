require "count_words"

RSpec.describe "#count_words" do
  it "should accept a string as an argument and return its word count" do
    expect(count_words("Hello, world")).to eq(2)
    expect(count_words("The quick brown fox jumps over the lazy dog")).to eq(9)
  end
end