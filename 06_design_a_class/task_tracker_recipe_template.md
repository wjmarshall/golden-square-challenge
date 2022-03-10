# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class TaskTracker
  def initialize
    # ...
  end

  def add(task) # task is a string
    # Stores the task
    # No return value
  end

  def list()
    # Throws an exception if no task is set
    # Otherwise, prints a list of tasks
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
task_tracker = TaskTracker.new
task_tracker.add("Walk the dog")
task_tracker.add("Wash the dishes")
task_tracker.list # => "Walk the dog", "Wash the dishes"

# 2
task_tracker = TaskTracker.new
task_tracker.list() # fails with "No tasks to list"

# 3
task_tracker = TaskTracker.new
task_tracker.add("") # fails with "No task added"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._