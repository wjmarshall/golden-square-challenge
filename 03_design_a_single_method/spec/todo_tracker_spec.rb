require "todo_tracker"

RSpec.describe "#todo_tracker" do
  it "should accept a string as an argument and return true if it includes '@TODO'" do
    expect(todo_tracker("Hello @TODO world")).to eq(true)
    expect(todo_tracker("@TODO: wash dishes")).to eq(true)
  end

  it "should return false if the string does not include '@TODO" do
    expect(todo_tracker("Hello world")).to eq(false)
    expect(todo_tracker("@todo: wash dishes")).to eq(false)
    expect(todo_tracker("TODO: wash dishes")).to eq(false)
  end
end