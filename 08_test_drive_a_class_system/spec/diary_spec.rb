require "diary"

RSpec.describe Diary do
  context "when initialized" do
    it "is empty" do
      diary = Diary.new
      expect(diary.all).to eq([])
    end
  end
end