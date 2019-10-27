class NYCRestaurantInspection::Restaurant

  attr_accessor :name, :boro, :zip_code, :violation_description, :critical_flag


def initialize(rest_insp_data)
  @name = rest_insp_data[:name]
  @boro = rest_insp_data[:boro]
  @zip_code = rest_insp_data[:violation_description]
  @critical_flag = rest_insp_data[:critical_flag]
end

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


  def list_restaurants
      @restaurants = NYCRestaurantInspection::API.nyc_data
  end

end

#NYCRestaurantInspection::Restaurant.new.gettind_date
