require "diary_entry"

RSpec.describe DiaryEntry do
  let(:diary_entry) { DiaryEntry.new("my title", "my diary contents") }
  let(:diary_entry_2) { DiaryEntry.new("another title", "phone number: 07123456789") }
  let(:diary_entry_3) { DiaryEntry.new("a different title", "phone numbers: 07000000000, 07111111111") }
  
  it "is initalized with a title and contents" do
    expect(diary_entry.title).to eq("my title")
    expect(diary_entry.contents).to eq("my diary contents")
    expect(diary_entry_2.title).to eq("another title")
    expect(diary_entry_2.contents).to eq("phone number: 07123456789")
  end

  it "can return an integer representing the word count of the contents" do
    expect(diary_entry.count_words).to eq(3)
    expect(diary_entry_3.count_words).to eq(4)
  end

  it "estimates reading time in minutes based on given wpm" do
    expect(diary_entry.reading_time(1)).to eq(3)
    expect(diary_entry.reading_time(2)).to eq(2)
    expect(diary_entry.reading_time(3)).to eq(1)
    expect(diary_entry.reading_time(50)).to eq(1)
  end

  it "can return phone number(s) found in a diary entry" do
    expect(diary_entry.phone_numbers).to eq([])
    expect(diary_entry_2.phone_numbers).to eq(["07123456789"])
    expect(diary_entry_3.phone_numbers).to eq(["07000000000", "07111111111"])
  end

end
