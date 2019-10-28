class NYCRestaurantInspection::API

  def self.getting_data
    data = HTTParty.get("https://data.cityofnewyork.us/resource/43nn-pn8j.json")
    binding.pry

    data.each do |inf|
      name = inf["dba"]
      zip_code = inf["zip_code"]
      violation_description = inf["violation_description"]
      critical_flag = inf["critical_flag"]

    rest_insp_data = {
      :dba => name,
      :zip_code => zip_code,
      :violation_description => violation_description,
      :critical_flag => critical_flag
    }
      NYCRestaurantInspection::Restaurant.new(rest_insp_data)
    end
  end
end
