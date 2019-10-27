class NYCRestaurantInspection::API

  include HTTParty
  base_uri "data.cityofnewyork.us/"
  #HTTParty is a module, we cannot create an class instance of a module in Ruby

  def nyc_data
    self.class.get('/43nn-pn8j.json')
  end

  rest_inspection = NYCRestaurantInspection::API.new
  #create new instance of a class

  def data_names
  rest_inspection.nyc_data.each do |name|
      p "Dba: #{name['dba']}"
  end

  def get_rest_address
    rest_inspection.nyc_data.each do |address|
      p "Boro: #{address['boro']} | Zipcode: #{address['zipcode']}"
  end

  def get_rest_address
    rest_inspection.nyc_data.each do |inf|
      p "Dba: #{inf['dba']} | Boro: #{inf['boro']} | Zipcode: #{inf['zipcode']} | Violation_desc: #{inf['violation_description']}"
  end

end



# def gettind_date
#   url = "https://data.cityofnewyork.us/resource/43nn-pn8j.json"
#   link = HTTParty.get(url)
#   binding.pry
# end
