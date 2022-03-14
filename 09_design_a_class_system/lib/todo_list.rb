class TodoList
  def initialize
    @entries = []
  end

  def add(todo)
    @entries << todo
  end

  def incomplete
    @entries.select { |entry| !entry.done? }
  end

  def complete
    @entries.select { |entry| entry.done? }
  end
end