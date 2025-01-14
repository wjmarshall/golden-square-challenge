require "diary_entry"

RSpec.describe DiaryEntry do
  subject(:diary_entry) { DiaryEntry.new("9th March", "Test driving classes") }

  it "is initalized with a title and contents" do
    expect(diary_entry.title).to eq("9th March")
    expect(diary_entry.contents).to eq("Test driving classes")
  end

  it "counts the number of words in the contents" do
    expect(diary_entry.count_words).to eq(3)
  end

  it "estimates reading time in minutes based on given wpm" do
    expect(diary_entry.reading_time(1)).to eq(3)
    expect(diary_entry.reading_time(2)).to eq(2)
    expect(diary_entry.reading_time(3)).to eq(1)
    expect(diary_entry.reading_time(50)).to eq(1)
  end

  it "returns a string with a chunk of contents that the user could read in a given number of minutes, until contents are fully read" do
    expect(diary_entry.reading_chunk(1, 1)).to eq("Test")
    expect(diary_entry.reading_chunk(1, 1)).to eq("driving")
    expect(diary_entry.reading_chunk(1, 1)).to eq("classes")
    expect(diary_entry.reading_chunk(1, 1)).to eq("Test")
    expect(diary_entry.reading_chunk(0, 0)).to eq(nil)
  end
end

