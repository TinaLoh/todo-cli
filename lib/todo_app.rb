class TodoApp < CommandLineApp
  def initialize(input, output)
    @input = input
    @output = output
    @projects = []
  end

  def real_puts message=""
    $stdout.puts message
  end


  def list
    case @projects.length
      when 0
        puts "Projects:\n  none"
      else
        puts "Projects:\n  #{@projects.join(", ")}"
    end
  end

  def create
    puts "Please enter the new project name:\n"
    project_name = gets.chomp
    project = Project.new(project_name)
    @projects << project
  end

  def rename
    puts "Please enter the project name to rename:\n"
    project_name = gets.chomp
    puts "Please enter the new project name:\n"
    new_project_name = gets.chomp
    puts "Projects:\n  #{new_project_name}"
    @projects << new_project_name
  end

  def delete
    puts "Please enter the project name to delete:\n"
    project_to_delete = gets.chomp
    @projects.delete_if {|project| project == project_to_delete}
    list
  end

  def edit
    project_to_edit = gets.chomp
    puts "Editing Project: #{project_to_edit}"
    puts "'list' to list tasks"
    puts "'create' to create a new task"
    puts "'edit' to edit a task"
    puts "'complete' to complete a task and remove it from the list"
  end

  def back

  end

  # def menu
  #   looping = true
  #   while looping
  #     user_reply = gets.chomp
  #
  #     if user_reply == "edit_project"
  #       edit_project
  #     elsif user_reply == "list_tasks"
  #       list_tasks
  #     else user_reply == "quit"
  #       break
  #     end
  #   end
  # end

  def run
    puts "Welcome"
    puts "'list' to list projects"
    puts "'create' to create a new project"
    puts "'rename' to rename a project"

    puts "Please enter: "
    user_reply = gets.chomp

    while user_reply != "quit" do

      case user_reply
        when "list"
          list
        when "create"
          create
        when "rename"
          rename
        when "delete"
          delete
        when "edit"
          edit
        when "back"
          back
      end

      user_reply = gets.chomp
    end

  end

end
