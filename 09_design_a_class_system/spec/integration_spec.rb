require "diary"
require "diary_entry"
require "todo_list"
require "todo"

RSpec.describe "overall integration" do

  describe "diary integration" do
    let(:diary) { Diary.new }
    let(:diary_entry) { DiaryEntry.new("my title", "my contents") }
    let(:diary_entry_2) { DiaryEntry.new("another title", "phone number: 07123456789") }
    let(:diary_entry_3) { DiaryEntry.new("a different title", "phone numbers: 07000000000, 07111111111") }

    it "stores and returns a list of entries" do
      diary.add(diary_entry)
      expect(diary.entries).to eq([diary_entry])
      diary.add(diary_entry_2)
      expect(diary.entries).to eq([diary_entry, diary_entry_2])
      diary.add(diary_entry_3)
      expect(diary.entries).to eq([diary_entry, diary_entry_2, diary_entry_3])
    end

    it "finds the best entry based on a given reading speed" do
      diary.add(diary_entry)
      diary.add(diary_entry_2)
      diary.add(diary_entry_3)
      expect(diary.select_entry(1, 2)).to eq(diary_entry)
      expect(diary.select_entry(1, 3)).to eq(diary_entry_2)
      expect(diary.select_entry(1, 4)).to eq(diary_entry_3)
    end

    it "returns a list of all mobile phone numbers in the diary" do
      diary.add(diary_entry)
      expect(diary.list_contacts).to eq([])
      diary.add(diary_entry_2)
      expect(diary.list_contacts).to eq(["07123456789"])
      diary.add(diary_entry_3)
      expect(diary.list_contacts).to eq(["07123456789", "07000000000", "07111111111"])
    end
  end

  describe "todo list integration" do
    let(:todo_list) { TodoList.new }
    let(:first_entry) { Todo.new("Wash the car") }
    let(:second_entry) { Todo.new("Paint the fence") }
    let(:third_entry) { Todo.new("Buy groceries") }
    let(:fourth_entry) { Todo.new("Fold laundry") }
    
    it 'adds todos to the todolist' do
      todo_list.add(first_entry)
      expect(todo_list.incomplete).to eq [first_entry]
      todo_list.add(second_entry)
      expect(todo_list.incomplete).to eq [first_entry, second_entry]
    end
  
    it 'returns all completed todos' do
      todo_list.add(first_entry)
      todo_list.add(second_entry)
      todo_list.add(third_entry)
      first_entry.mark_done!
      expect(todo_list.complete).to eq [first_entry]
      third_entry.mark_done!
      expect(todo_list.complete).to eq [first_entry, third_entry]
    end
  
    it 'returns any incomplete todos' do
      todo_list.add(first_entry)
      todo_list.add(second_entry)
      todo_list.add(third_entry)
      todo_list.add(fourth_entry)
      first_entry.mark_done!
      expect(todo_list.incomplete).to eq [second_entry, third_entry, fourth_entry]
      third_entry.mark_done!
      expect(todo_list.incomplete).to eq [second_entry, fourth_entry]
    end
  end
end

      