require "diary"
require "diary_entry"

RSpec.describe "diary integration" do

  subject(:diary) { Diary.new }
  let(:diary_entry) { DiaryEntry.new("my title", "my diary contents") }
  let(:diary_entry_2) { DiaryEntry.new("another title", "some more diary contents") }

  it "accepts and returns a list of diary entries" do
    diary.add(diary_entry)
    diary.add(diary_entry_2)
    expect(diary.all).to eq([diary_entry, diary_entry_2])
  end

  it "counts the number of words in all diary entries" do
    diary.add(diary_entry)
    diary.add(diary_entry_2)
    expect(diary.count_words).to eq(7)
  end

  it "estimates reading time for all diary contents based on a given reading speed" do
    diary.add(diary_entry)
    diary.add(diary_entry_2)
    expect(diary.reading_time(1)).to eq(7)
    expect(diary.reading_time(2)).to eq(4)
    expect(diary.reading_time(3)).to eq(3)
    expect(diary.reading_time(4)).to eq(2)
    expect { diary.reading_time(0) }.to raise_error("Error: Invalid wpm")
  end

  it "finds the best entry based on a given reading speed" do
    diary.add(diary_entry)
    diary.add(diary_entry_2)
    expect(diary.find_best_entry_for_reading_time(1, 3)).to eq(diary_entry)
    expect(diary.find_best_entry_for_reading_time(1, 4)).to eq(diary_entry_2)
  end
end



  