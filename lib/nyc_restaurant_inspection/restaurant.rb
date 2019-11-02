class NYCRestaurantInspection::Restaurant

  attr_accessor :name, :zipcode, :violation_description, :grade

  @@all = []

  def initialize(rest_insp_data)
    @name = rest_insp_data[:dba]
    @name = "Name is not exist" unless @name
    @zipcode = rest_insp_data[:zipcode]
    @zipcode = "Zipcode is not exist" unless @zipcode
    @violation_description = rest_insp_data[:violation_description]
    @grade = rest_insp_data[:grade]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.rest_by_zip_code(zipcode)
    self.all.select{|rest| rest.zipcode == zipcode}
  end

  def self.rest_by_name(name_rest)
    #
    self.all.select{|rest_n| rest_n.name.downcase.include?(name_rest.downcase)}
    # self.all.select{|rest_n|
    #   # binding.pry
    #   # puts rest_n.name
    #   rest_n.name.include?(name_rest)}
  end

end
# CASA MEXICANA
#NYCRestaurantInspection::Restaurant.all.length
# NYCRestaurantInspection::Restaurant.all.map
