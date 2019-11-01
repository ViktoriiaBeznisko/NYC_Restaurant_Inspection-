class NYCRestaurantInspection::CLI

  def call
    NYCRestaurantInspection::API.getting_data
    welcome
    #list_results
    # search_by_name
    # search_by_zip_code
    leave_page
  end

  def welcome
    puts "Welcome to New York City Restaurant Inspection tracker!"
    puts "Do you really want to know Health Inspection result for your favorite restaurant?[y/n]"
      input = gets.strip.downcase
      if input == "y"

       puts <<-DOC.gsub /^\s*/, ''
          Please select from the list or type exit[1/2]:
          1 Search by name
          2 Search by zip code
        DOC
        input = gets.strip.downcase
      if input == "1"
        search_by_name
      elsif input == "2"
        search_by_zip_code
      elsif input == "exit"
        leave_page
      else
        puts "Not sure what you want..."
      end
    end
  end

  def search_by_name
      puts "Please type name of the restaurant:"
      input = gets.strip.downcase
      results =  NYCRestaurantInspection::Restaurant.rest_by_name(input)
      #binding.pry
      list_results(results)
    end
#  end

  def search_by_zip_code
    # input = nil
    # while input != "exit"
      puts "Please type zip code:"
      input = gets.strip.downcase
      results = NYCRestaurantInspection::Restaurant.rest_by_zip_code(input)
      list_results(results)
   end
#  end

  def list_results(restaurant)
    restaurant.each{|rest| puts "- #{rest.name}","- #{rest.zip_code}","- #{rest.violation_description}","- #{rest.grade}"}
  end

  def leave_page
    puts "Eat, drink, be healthy! Goodbye!"
  end
end
