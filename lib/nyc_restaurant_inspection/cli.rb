class NYCRestaurantInspection::CLI

  def call
    NYCRestaurantInspection::API.getting_data
    welcome
  end

  def welcome
    puts "Welcome to New York City Restaurant Inspection tracker!"
    puts "Do you really want to know Health Inspection result for your favorite restaurant?[y/n]"
    input = gets.strip.downcase
    if input == "y"
      menu
    elsif input == "n" || input == "exit"
      leave_page
    else
      not_found
    end
  end

  def menu
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
      not_found
    end
  end

  def search_by_name
    puts "Please type name of the restaurant:"
    input = gets.strip.downcase
    results =  NYCRestaurantInspection::Restaurant.rest_by_name(input)
    list_results(results)
    menu
  end

  def search_by_zip_code
    puts "Please type zip code:"
    input = gets.strip.downcase
    results = NYCRestaurantInspection::Restaurant.rest_by_zip_code(input)
    list_results(results)
    menu
  end

  def list_results(restaurant)
    restaurant.each{|rest| puts "- Restaurant name: #{rest.name}","- Zip Code: #{rest.zipcode}","- Inspectors Report: #{rest.violation_description}","- Grade: #{rest.grade}", ""}
  end

  def not_found
    puts "The search has not given any results"
    menu
  end

  def leave_page
    puts "Eat, drink, be healthy! Goodbye!"
  end
end
