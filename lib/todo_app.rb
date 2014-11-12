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
    @projects << project_name
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

  def edit_project
    project_to_edit = gets.chomp
    puts "Editing Project:  #{project_to_edit}"
  end

  def list_tasks
    puts "'list' to list tasks"
  end


  def menu
    looping = true
    while looping
      input = gets.chomp

      if input == "edit_project"
        edit_project
      elsif input == "list_tasks"
        list_tasks
      else input == "quit"
        break
      end
    end
  end

  def run
    puts "Welcome"
    puts "'list' to list projects"
    puts "'create' to create a new project"
    puts "'rename' to rename a project"

    puts "Please enter: "
    input = gets.chomp

    while input != "quit" do

      case input
        when "list"
          list
        when "create"
          create
        when "rename"
          rename
        when "delete"
          delete
        # when "edit_project"
        #   edit_project
        # else "list_tasks"
        #   list_tasks

      end

      input = gets.chomp
    end

  end

end
