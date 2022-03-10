require "task_tracker"

RSpec.describe TaskTracker do
  subject(:task_tracker) { TaskTracker.new }
  it "stores and reproduces a list of tasks" do
    task_tracker.add("Walk the dog")
    expect(task_tracker.list).to eq(["Walk the dog"])

    task_tracker.add("Wash the dishes")
    expect(task_tracker.list).to eq(["Walk the dog", "Wash the dishes"])
  end

  it "fails if there are no tasks to list" do
    expect { task_tracker.list }.to raise_error("No tasks to list")
  end

  it "fails if an empty string is added as a task" do
    expect { task_tracker.add("") }.to raise_error("No task added")
  end

  it "removes completed tasks from the list" do
    task_tracker.add("Walk the dog")
    task_tracker.add("Wash the dishes")
    task_tracker.mark_as_complete("Walk the dog")
    expect(task_tracker.list).to eq(["Wash the dishes"])
    expect {task_tracker.mark_as_complete("Make dinner") }.to raise_error("Task not found")
  end

end
    