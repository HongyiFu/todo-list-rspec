require "rspec"

require_relative "list"
require_relative 'task'

describe List do
  # Your specs here
  let(:title) { "some_title"}
  let(:task) { Task.new("some_description") }

  describe "#initialize" do 
  	it "requires at least one argument" do 
  		expect { List.new() }.to raise_error(ArgumentError)
  	end
  end 

  describe "#add_task" do
  	it "adds element to the tasks" do
  		list = List.new(title, [Task.new("some_task")])
  		num_of_elements = list.tasks.length
  		list.add_task(task)
  		expect(list.tasks.include? task).to be true
  	end

  	it "adds element to the tasks, thus resulting in length + 1" do
  		list = List.new(title, [Task.new("some_task")])
  		num_of_elements = list.tasks.length
  		list.add_task(task)
  		expect(list.tasks.length).to be num_of_elements + 1
  	end
  end

  describe "#complete_task" do
  	it "takes an index as its argument" do
  		list = List.new(title,[task])
  		expect { list.complete_task("0") }.to raise_error(TypeError) 
  	end

  	it "marks a task as complete if index is valid" do
  		list = List.new(title,[task])
  		list.complete_task(0)
  		expect(list.tasks[0].complete?).to be true
  	end
  end

  describe "#delete_task" do 
  	it "deletes the task at given index" do 
  		list = List.new(title,[task])
  		first_task = list.delete_task(0)
  		expect(list.tasks.include? first_task).to be false
  	end
  end

  describe "#completed_tasks" do
  	it "selects all completed tasks" do
  		task_two = Task.new("task two")
  		task_three = Task.new("task three")
  		list = List.new(title, [task, task_two, task_three])
  		list.complete_task(1)
  		list.complete_task(2)
  		expect(list.completed_tasks == [task_two,task_three]).to be true
  	end
  end

  describe "#incomplete_tasks" do 
  	it "selects all incomplete tasks" do
  		task_two = Task.new("task two")
  		task_two.complete!
  		task_three = Task.new("task three")
  		list = List.new(title, [task, task_two, task_three])
  		expect(list.incomplete_tasks == [task,task_three]).to be true
  	end

  end

end