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

      if input == "y"
        puts <<-DOC
        Please select from the list or type exit[1/2]:
        1 Search by name
        2 Search by zip code
        DOC

        input = gets.strip.downcase
      if input == "1"   #I have two times get strip ... should I create new methode ?....
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

  # def list_restaurants
  #   @restaurants = NYCRestaurantInspection::Restaurant.all
  # end

  def search_by_name   #(name)
    input = nil
    while input != "exit"
      puts "Please type name of the restaurant:"
      input = gets.strip.downcase
      results =  NYCRestaurantInspection::Restaurant.rest_by_name(input)
      list_results
      end
    end

  def search_by_zip_code
    input = nil
    while input != "exit"
      puts "Please type zip code:"
      input = gets.strip.downcase
        NYCRestaurantInspection::Restaurant.rest_by_zip_code(input) # how to connect with other results ? shold i initialize ?
      end
    end


    def list_results(restaurants)
      restaurants.each{|restaurants| puts restaurants.name}  ###

    end

  def leave_page
    puts "Eat, drink, be healthy! Goodbye!"
  end

end
