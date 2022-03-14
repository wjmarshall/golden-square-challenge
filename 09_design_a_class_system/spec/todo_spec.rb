require 'todo'

RSpec.describe Todo do
  it 'is initalized with a task' do
    todo = Todo.new("Wash the car")
    expect(todo.task).to eq("Wash the car")
  end

  it 'marks the todo as done' do
    new_task = Todo.new("Wash the car")
    new_task.mark_done!
    expect(new_task.done?).to eq(true)
  end

  it 'returns false when task is incomplete' do
    new_task = Todo.new("Wash the car")
    expect(new_task.done?).to eq(false)
  end
end