require "grammar_stats"

RSpec.describe GrammarStats do
  subject(:grammar_stats) { GrammarStats.new }
  
  it "checks whether a sentence begins with a capital letter and ends with an appropriate punctuation mark" do
    expect(grammar_stats.check("Hello world!")).to eq(true)
    expect(grammar_stats.check("Hello world?")).to eq(true)
    expect(grammar_stats.check("Hello world.")).to eq(true)
    expect(grammar_stats.check("hello world.")).to eq(false)
    expect(grammar_stats.check("Hello world")).to eq(false)
    expect(grammar_stats.check("hello world")).to eq(false)
  end

  it "calculates the percentage of texts which passed the grammar check" do
    expect(grammar_stats.percentage_good).to eq(0)

    grammar_stats.check("Hello world!")
    expect(grammar_stats.percentage_good).to eq(100)

    grammar_stats.check("hello world")
    expect(grammar_stats.percentage_good).to eq(50)

    grammar_stats.check("hello world.")
    expect(grammar_stats.percentage_good).to eq(33)

    grammar_stats.check("Hello world.")
    expect(grammar_stats.percentage_good).to eq(50)
  end
end




