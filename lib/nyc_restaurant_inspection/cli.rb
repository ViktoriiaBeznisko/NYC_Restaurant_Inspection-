class NYCRestaurantInspection::CLI

  def call
    NYCRestaurantInspection::API.getting_data
    welcome
  end

  def welcome
    puts "Welcome to New York City Restaurant Inspection tracker!".colorize(:color => :black, :background => :yellow)
    puts "Do you really want to know Health Inspection result for your favorite restaurant?[y/n]".yellow
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
    puts "Please type name of the restaurant:".yellow
    input = gets.strip
    results = NYCRestaurantInspection::Restaurant.rest_by_name(input)
    list_results(results)
    if list_results(results).empty?
      not_found
    else
      menu
    end
  end

  def search_by_zip_code
    puts "Please type zip code:".yellow
    input = gets.strip
    results = NYCRestaurantInspection::Restaurant.rest_by_zip_code(input)
    list_results(results)
    if list_results(results).empty?
      not_found
    else
      menu
    end
  end

  def list_results(restaurant)
    restaurant.each{|rest| puts "- Restaurant name: #{rest.name}".green,"- Zip Code: #{rest.zipcode}","- Inspectors Report: #{rest.violation_description}","- Critical Flag (yes/no): #{rest.critical_flag}", ""}
  end

  def not_found
    puts "Unfortunately your search has not prodused any results...".red
    menu
  end

  def leave_page
    puts "Eat, drink, be healthy! Goodbye!".colorize(:color => :black, :background => :yellow)
  end
end
