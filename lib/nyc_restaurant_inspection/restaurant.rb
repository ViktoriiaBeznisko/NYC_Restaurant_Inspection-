class NYCRestaurantInspection::Restaurant

  attr_accessor :name, :boro, :zip_code,

  def self.insp_results
      self.scrape_insp_results
# IN ORDER TO TEST SLI UNCOMMECT THE FOLOWING AND COMMENT THE ABOVE
        # rest_1 = self.new
        # rest_1.name = "RICHIE RICH"
        # rest_1.boro = "BRONX"
        # rest_1.zip_code = "10456"
        #
        # rest_2 = self.new
        # rest_2.name = "RICHIE RICH22"
        # rest_2.boro = "BRONX22"
        # rest_2.zip_code = "1045622"
        # [rest_1, rest_2]
  end

  def self.scrape_insp_results
    insp_results = []

    insp_results << self.scrape
    insp_results
  end

  def self.scrape
    doc = Nokogiri::HTML(open("https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/rs6k-p7g6"))
    # https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/43nn-pn8j
    # https://data.cityofnewyork.us/resource/43nn-pn8j.xml
    table = doc.at('card.card.ng-isolate-scope')
    table.search('tr').each do |tr|
    cells = tr.search('th, td')
    # cells.each do |cell|
    # text = cell.text.strip
    # puts CSV.generate_line(cells)

      binding.pry
    end
  end
end












#name = doc.search('.cell.text').text.strip
#NYCRestaurantInspection::Restaurant.scrape

# rest_1 = self.new
# rest_1.name = "RICHIE RICH"
# rest_1.boro = "BRONX"
# rest_1.zip_code = "10456"
# rest_1.cousine = "Caribbean"
# rest_1.insp_date = "12/18/2018"
# rest_1.critical_flag = "Y"
# rest_1.violation_desc = "Food not cooled by an approved method whereby the internal product...."
