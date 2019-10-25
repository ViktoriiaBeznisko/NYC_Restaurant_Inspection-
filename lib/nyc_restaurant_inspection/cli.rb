class NYCRestaurantInspection::CLI

  def call
    puts "Welcome to New York City Restaurant Inspection tracker!"
    
    puts "Do you really want to know Health Inspection result for your favorite restaurant?[y/n]"
      if gets.strip == "y"
        find_restaurant
      else 
        leave_page  
      end      
  end

  def find_restaurant
    puts "Please select from the list:"
    #need to make it real
    puts <<-DOC
      1. hola hola
      2. lovee
    DOC
  end

  def leave_page
    puts "Eat, drink, be healthy! Goodbye!"
  end
  
end
