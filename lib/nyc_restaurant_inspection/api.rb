class NYCRestaurantInspection::API

  def gettind_date
    url = "https://data.cityofnewyork.us/resource/43nn-pn8j.json"
    link = HTTParty.get(url)
    binding.pry
  end

end
