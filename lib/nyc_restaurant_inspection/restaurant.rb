class NYCRestaurantInspection::Restaurant

  attr_accessor :name, :boro, :zip_code, :cousine, :insp_date, :critical_flag, :violation_desc

  def self.insp_results
    self.scrape_insp_results
  end

  def self.scrape_insp_results
    insp_results = []

    insp_results << self.scrape
    insp_results
  end

  def self.scrape
    doc = Nokogiri::HTML(open("https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/rs6k-p7g6"))
    #doc.css(".cell.context")
    binding.pry
  end
end

#name = doc.search('table-row.div.cell.text').text

# tables = doc.search('card.card.ng-isolate-scope').text


#NYCRestaurantInspection::Restaurant.scrape

# rest_1 = self.new
# rest_1.name = "RICHIE RICH"
# rest_1.boro = "BRONX"
# rest_1.zip_code = "10456"
# rest_1.cousine = "Caribbean"
# rest_1.insp_date = "12/18/2018"
# rest_1.critical_flag = "Y"
# rest_1.violation_desc = "Food not cooled by an approved method whereby the internal product...."
