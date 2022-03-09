require "check_grammar"

RSpec.describe "#check_grammar" do
  it "should return false if the string does not begin with a capital letter" do
    expect(check_grammar("hello")).to eq(false)
    expect(check_grammar("hello world.")).to eq(false)
  end

  it "should return false if the string does not end with a suitable sentence-ending punctuation mark" do
    expect(check_grammar("Hello world")).to eq(false)
    expect(check_grammar("Hello world:")).to eq(false)
  end

  it "should return true if the string starts with a capital letter and ends with a suitable punctuation mark" do
    expect(check_grammar("Hello, world.")).to eq(true)
    expect(check_grammar("Hello, world!")).to eq(true)
    expect(check_grammar("Hello, world?")).to eq(true)
  end
end