require "todo_list"

RSpec.describe TodoList do
  it "is empty when initalized" do
    todo_list = TodoList.new
    expect(todo_list.incomplete).to eq([])
    expect(todo_list.complete).to eq([])
  end
end