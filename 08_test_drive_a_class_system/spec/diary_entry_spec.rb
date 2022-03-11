require "diary_entry"

RSpec.describe DiaryEntry do
  subject(:diary_entry) { DiaryEntry.new("my title", "my diary contents") }
  it "is initalized with a title and contents" do
    expect(diary_entry.title).to eq("my title")
    expect(diary_entry.contents).to eq("my diary contents")
  end

  it "can return an integer representing the word count of the contents" do
    expect(diary_entry.count_words).to eq(3)
  end

  it "estimates reading time in minutes based on given wpm" do
    expect(diary_entry.reading_time(1)).to eq(3)
    expect(diary_entry.reading_time(2)).to eq(2)
    expect(diary_entry.reading_time(3)).to eq(1)
    expect(diary_entry.reading_time(50)).to eq(1)
  end

  it "returns a string with a chunk of contents that the user could read in a given number of minutes, until contents are fully read" do
    expect(diary_entry.reading_chunk(1, 1)).to eq("my")
    expect(diary_entry.reading_chunk(1, 1)).to eq("diary")
    expect(diary_entry.reading_chunk(1, 1)).to eq("contents")
    expect(diary_entry.reading_chunk(1, 1)).to eq("my")
    expect(diary_entry.reading_chunk(0, 0)).to eq(nil)
  end

end
