class NYCRestaurantInspection::Scraper

  def scrape_inspection_results
    @doc = Nokogiri::HTML(open("https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/rs6k-p7g6"))
  end

end
