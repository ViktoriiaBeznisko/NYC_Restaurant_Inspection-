class NYCRestaurantInspection::CLI

  def call
    puts "Welcome to New York City Restaurant Inspection tracker!"

    puts "Do you really want to know Health Inspection result for your favorite restaurant?[y/n]"
      if gets.strip == "y"
        finding_options
      else
        leave_page
      end
  end

  def list_of_options
    puts "list_of_options:"
  end

  def finding_options
    input = nil
    while input != "exit"
      puts "Please select from the list or type exit"
      list_of_options
      input = gets.strip.downcase
      case input
        when "1"
          puts "1"
        when "2"
          puts "2"
        when "exit"
          leave_page
        else
          puts "Not sure what you want, please select from the list or type exit."
        end
      end
  end

  def leave_page
    puts "Eat, drink, be healthy! Goodbye!"
  end

end
