class NYCRestaurantInspection::CLI

  def call
    welcome
    list_restaurants
    menu
  end

  def welcome
  puts "Welcome to New York City Restaurant Inspection tracker!"
  puts "Do you really want to know Health Inspection result for your favorite restaurant?[y/n]"
    if gets.strip == "y"
      puts <<-DOC
      Please select from the list or type exit[1/2]:
      1 Search by name
      2 Search by zip code
      DOC
    if gets.strip == "1"
      search_by_name
    elsif gets.strip == "2"
       search_by_zip_code
    end
  end

  def search_by_name
    puts "Please type name of the restaurant:"
    if gets.strip ==
  end

  def search_by_zip_code
    puts "Please type zip code:"
    NYCRestaurantInspection.rest_by_zip_code(number)
  end


  def list_restaurants
    @restaurants = NYCRestaurantInspection::Restaurant.all
  #  @restaurants.each.with_index(1) do |restaurant, i|
  #    puts "#{i}. #{restaurant.name} - #{restaurant.boro} - #{restaurant.zip_code}"
  #  end
  end

  def menu
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        rest_result = @restaurants[input.to_i-1]
        puts "#{name} - #{zip_code} - #{critical_flag} - #{violation_description}"
      elsif input == "list"
        list_restaurants
      elsif input == "exit"
        leave_page
          else
        puts "Not sure what you want..."
      end
    end
  end

  def leave_page
    puts "Eat, drink, be healthy! Goodbye!"
  end
end
