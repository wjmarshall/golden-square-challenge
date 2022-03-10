class TaskTracker
  def initialize
    @tasks = []
  end

  def add(task)
    fail "No task added" if task.empty?
    @tasks << task
  end

  def list
    fail "No tasks to list" if @tasks.empty?
    @tasks
  end
end