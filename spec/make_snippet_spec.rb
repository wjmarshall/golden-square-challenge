require "make_snippet"

RSpec.describe "make_snippet" do
  context "when the string is longer than 5 words" do
    it "should return the first 5 words + '...'" do
      result = make_snippet("Today I learned about test driven development")
      expect(result).to eq("Today I learned about test...")
    end
  end
  context "when the string contains 5 words or fewer" do
    it "returns the string" do
      result_1 = make_snippet("I love TDD")
      result_2 = make_snippet("This string contains five words")
      expect(result_1).to eq("I love TDD")
      expect(result_2).to eq("This string contains five words")
    end
  end
end