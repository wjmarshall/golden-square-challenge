require "check_grammar"

RSpec.describe "#check_grammar" do
  context "when the string does not begin with a capital letter" do
    it "should return false" do
      expect(check_grammar("hello")).to eq(false)
      expect(check_grammar("hello world.")).to eq(false)
    end
  end

  context "when the string does not end with a suitable sentence-ending punctuation mark" do
    it "should return false" do
      expect(check_grammar("Hello world")).to eq(false)
      expect(check_grammar("Hello world:")).to eq(false)
    end
  end

  context "when the string starts with a capital letter and ends with a suitable punctuation mark" do
    it "should return true" do
      expect(check_grammar("Hello, world.")).to eq(true)
      expect(check_grammar("Hello, world!")).to eq(true)
      expect(check_grammar("Hello, world?")).to eq(true)
    end
  end
end