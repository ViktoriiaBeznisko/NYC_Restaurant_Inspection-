class NYCRestaurantInspection::API
include HTTParty

format :json
base_uri "https://data.cityofnewyork.us/resource/43nn-pn8j"

  def self.getting_data
    response = HTTParty.get("https://data.cityofnewyork.us/resource/43nn-pn8j.json")
  #  binding.pry

    response.each do |inf|
      name = inf["dba"]
      zipcode = inf["zipcode"]
      violation_description = inf["violation_description"]
      critical_flag = inf["critical_flag"]

    rest_insp_data = {
      :dba => name,
      :zipcode => zipcode,
      :violation_description => violation_description,
      :critical_flag => critical_flag
    }
      NYCRestaurantInspection::Restaurant.new(rest_insp_data)
    end
  end
end
