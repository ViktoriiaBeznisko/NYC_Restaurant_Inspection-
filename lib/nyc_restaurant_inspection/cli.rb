class NYCRestaurantInspection::CLI

  def call
    welcome
    list_restaurants
    menu
    leave_page
  end

  def welcome
  puts "Welcome to New York City Restaurant Inspection tracker!"
  puts "Do you really want to know Health Inspection result for your favorite restaurant?[y/n]"
    if gets.strip == "y"
      puts "Menu"
    end
  end

  def list_restaurants
    @restaurants = NYCRestaurantInspection::Restaurant.insp_results
    @restaurants.each.with_index(1) do |restaurant, i|
      puts "#{i}. #{restaurant.name} - #{restaurant.boro} - #{restaurant.zip_code}"
    end
  end

  def menu
    input = nil
    while input != "exit"

      puts <<-DOC.gsub /^\s*/, ''
      Please select from the list or type exit:
      1 Search by name
      2 Search by zip code
      3 Search by BORO [Manhattan/Brooklyn/Bronx/Queens/Staten Island]
      DOC
      input = gets.strip.downcase

      if input.to_i > 0
        rest_result = @restaurants[input.to_i-1]
        puts "#{rest_result.name} - #{rest_result.boro} - #{rest_result.zip_code}"
      elsif input == "list"
        list_restaurants
      else
        puts "Meh, not sure what you want..."
      end
    end
  end

  def leave_page
    puts "Eat, drink, be healthy! Goodbye!"
  end
end
