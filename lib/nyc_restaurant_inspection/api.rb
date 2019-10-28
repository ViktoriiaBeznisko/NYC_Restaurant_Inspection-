class NYCRestaurantInspection::API

  include HTTParty
  base_uri "data.cityofnewyork.us/"
  #HTTParty is a module, we cannot create an class instance of a module in Ruby

  def nyc_data
    self.class.get('/43nn-pn8j.json')
  end

  def self.
  rest_inspection = NYCRestaurantInspection::API.new
  #create new instance of a class

  rest_inspection.nyc_data.each do |i|
    name = i["dba"]
    boro = i["boro"]
    zip_code = i["zip_code"]
    violation_description = i["violation_description"]
    critical_flag = i["critical_flag"]

    rest_insp_data = {
      :dba => name,
      :boro => boro,
      :zip_code => zip_code,
      :violation_description => violation_description,
      :critical_flag => critical_flag
    }
    NYCRestaurantInspection::Restaurant.new(rest_insp_data)
    end

  end

  # def self.all
  #   @@all
  # end

  # def gettind_date
  #   url = "https://data.cityofnewyork.us/resource/43nn-pn8j.json"
  #   link = HTTParty.get(url)
  #   binding.pry
  # end
