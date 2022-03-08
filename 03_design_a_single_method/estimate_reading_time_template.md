# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby


reading_time = estimate_reading_time(word_count)

word_count = number of words in a text
reading_time = estimated number of minutes to read it (rounded upwards)


```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

estimate_reading_time(200) => 1
estimate_reading_time(250) => 2
estimate_reading_time(1) => 1
estimate_reading_time(0) => 0
estimate_reading_time(-1) => error
estimate_reading_time(1000) => 5


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._