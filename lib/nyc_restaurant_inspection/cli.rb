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
    @options = NYCRestaurantInspection::Restaurant.all
    # @options.each.with_index(1) do |option, i|
    #   puts "#{i}. #{deal}"
  end

  def finding_options
    input = nil
    while input != "exit"
      puts "Please select from the list or type exit"
      input = gets.strip.downcase

      if input.to_i > 0
        puts @options[input.to_i-1]
      elsif input == "list"
        list_of_options
      # case input
      #   when "1"
      #     puts "1"
      #   when "2"
      #     puts "2"
      #   when "exit"
      #     leave_page
        else
          puts "Meh, not sure what you want..."
        end
      end
  end

  def leave_page
    puts "Eat, drink, be healthy! Goodbye!"
  end

end
