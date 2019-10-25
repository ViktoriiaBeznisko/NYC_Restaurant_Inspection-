class NYCRestaurantInspection::Restaurant

  attr_accessor :name, :insp_result, :url

  def self.insp_results
    rest_1 = self.new
    rest_1.name = "RICHIE RICH"
    rest_1.boro = "BRONX"
    rest_1.zip_code = "10456"
    rest_1.cousine = "Caribbean"
    rest_1.insp_dete = "12/18/2018"
    rest_1.critical_flag = "Y"
    rest_1.violation_desc = "Food not cooled by an approved method whereby the internal product...."
  end



  def self.scrape_insp_results
    #doc = Nokogiri::HTML(open("https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/rs6k-p7g6"))
puts "me"
    # class="cell text"
    #   data-index="1"
  end

end
