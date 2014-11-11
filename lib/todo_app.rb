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
        puts "Projects:\n none"
      else
        puts "Projects:\n " + @projects.join()
    end

  end

  def create
    puts "Please enter the new project name:\n"
    project_name = gets.chomp
    @projects << project_name
  end

  def edit
    puts "Please enter the project name to rename:\n"
    project_name = gets.chomp
    puts "Please enter the new project name:\n"
    new_project_name = gets.chomp
    @projects << new_project_name
  end


  def run
    puts "Welcome"
    puts "'list' to list projects"
    puts "'create' to create a new project"
    puts "'edit' to edit a project"
    # puts "Projects:\n  none"
    # puts "Please enter the new project name:\n"
    # puts "Projects:\n  Chores"
    # puts "Please enter the project name to rename:\n"
    # puts "Projects:\n  Groceries"
    # puts "Please enter the project name to delete:\n"

    puts "Please enter: "
    input = gets.chomp

    while input != "quit" do

      case input
        when "list"
          list
        when "create"
          create
        when "edit"
          edit
      end

      input = gets.chomp
    end


  # def delete
  #   puts "Please enter the project name to delete:\n"
  #   puts "Projects:\n  none"
  # end


  end



end
