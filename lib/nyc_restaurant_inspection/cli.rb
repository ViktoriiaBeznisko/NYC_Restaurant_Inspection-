class NYCRestaurantInspection::CLI

  def call
    welcome
    list_restaurants
    #search_by_name
    #search_by_zip_code
  end

  def welcome
    puts "Welcome to New York City Restaurant Inspection tracker!"
    puts "Do you really want to know Health Inspection result for your favorite restaurant?[y/n]"
      input = gets.strip.downcase

      if gets.strip == "y"
        puts <<-DOC
        Please select from the list or type exit[1/2]:
        1 Search by name
        2 Search by zip code
        DOC
      input = gets.strip.downcase

      if gets.strip == "1"   #I have two times get strip ... should I create new methode ?....
        search_by_name
      elsif gets.strip == "2"
        search_by_zip_code
      elsif gets.strip == "exit"
        leave_page
      else
        puts "Not sure what you want..."
      end
    end
  end

  def list_restaurants
    @restaurants = NYCRestaurantInspection::Restaurant.all
  end

  def search_by_name
    input = nil
    while input != "exit"
      puts "Please type name of the restaurant:"
    input = gets.strip.downcase
    if input.to_i > 0 # how to say if input =  name from array
    result = @restaurants[input.to_i-1]
      puts "#{result.name} - #{result.zip_code} - #{result.critical_flag} - #{result.violation_description}"
    end
  end

  def search_by_zip_code
    input = nil
    while input != "exit"
      puts "Please type zip code:"
    input = gets.strip.downcase # how to connect.. if input ...
      if input == (number) #?????????
      NYCRestaurantInspection::Restaurant.rest_by_zip_code(number) # how to connect with other results ? shold i initialize ?
    end
  end

  def leave_page
    puts "Eat, drink, be healthy! Goodbye!"
  end
end
