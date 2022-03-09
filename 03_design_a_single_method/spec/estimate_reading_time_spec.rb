require "estimate_reading_time"

RSpec.describe "#estimate_reading_time" do
  it "should accept a word count and return a reading time based on 200 words per minute" do
    expect(estimate_reading_time(200)).to eq("Approximately 1 minute(s)")
    expect(estimate_reading_time(1000)).to eq("Approximately 5 minute(s)")
    expect(estimate_reading_time(0)).to eq("Approximately 0 minute(s)")
  end

  it "should return a reading time rounded upwards to the next minute" do
    expect(estimate_reading_time(250)).to eq("Approximately 2 minute(s)")
    expect(estimate_reading_time(1)).to eq("Approximately 1 minute(s)")
    expect(estimate_reading_time(599)).to eq("Approximately 3 minute(s)")
  end

  it "should return an error if the word count is less than zero" do
    expect { estimate_reading_time(-5) }.to raise_error("Error: word count must be a positive number")
  end

end