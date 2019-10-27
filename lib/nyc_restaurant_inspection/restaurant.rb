class NYCRestaurantInspection::Restaurant

  attr_accessor :name, :boro, :zip_code

  def self.insp_results
      #self.scrape_insp_results
# IN ORDER TO TEST SLI UNCOMMECT THE FOLOWING AND COMMENT THE ABOVE
        rest_1 = self.new
        rest_1.name = "RICHIE RICH"
        rest_1.boro = "BRONX"
        rest_1.zip_code = "10456"

        rest_2 = self.new
        rest_2.name = "RICHIE RICH22"
        rest_2.boro = "BRONX22"
        rest_2.zip_code = "1045622"
        [rest_1, rest_2]
  end

  # def self.scrape_insp_results
  #   insp_results = []
  #
  #   insp_results << self.scrape
  #   insp_results
  # end


  def self.scrape
   doc2 = Nokogiri::HTML(open("https://www.allrecipes.com/recipes/276/desserts/cakes//"))
  end

end

#NYCRestaurantInspection::Restaurant.new.gettind_date
#html_doc = Nokogiri::HTML(open("https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/43nn-pn8j"))

# nane1 =  doc.css("h2.list-recipes__h2")


# name = doc.search("h2.list-recipes__h2").text









# rest_1 = self.new
# rest_1.name = "RICHIE RICH"
# rest_1.boro = "BRONX"
# rest_1.zip_code = "10456"
# rest_1.cousine = "Caribbean"
# rest_1.insp_date = "12/18/2018"
# rest_1.critical_flag = "Y"
# rest_1.violation_desc = "Food not cooled by an approved method whereby the internal product...."
