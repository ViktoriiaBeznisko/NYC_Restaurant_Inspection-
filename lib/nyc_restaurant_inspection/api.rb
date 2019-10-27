class NYCRestaurantInspection::API

@@names = []
@@boro = []
@@zipcodes = []
@@

  def gettind_data
    url = "https://data.cityofnewyork.us/resource/43nn-pn8j.json"
    link = HTTParty.get(url)
    binding.pry
  end

  def get_rest_name
    self.gettind_data.each do |name|
      p "Dba: #{name['dba']}"
  end

  def get_rest_address
    self.gettind_data.each do |address|
      p "Boro: #{address['boro']} | Zipcode: #{address['zipcode']}"
  end

  def get_rest_address
    self.gettind_data.each do |inf|
      p "Dba: #{inf['dba']} | Boro: #{inf['boro']} | Zipcode: #{inf['zipcode']} | Violation_desc: #{inf['violation_description']}"
  end

end



# def gettind_date
#   url = "https://data.cityofnewyork.us/resource/43nn-pn8j.json"
#   link = HTTParty.get(url)
#   binding.pry
# end
