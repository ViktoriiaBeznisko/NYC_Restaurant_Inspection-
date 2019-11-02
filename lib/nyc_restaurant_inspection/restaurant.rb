class NYCRestaurantInspection::Restaurant

  attr_accessor :name, :zipcode, :violation_description, :grade

  @@all = []

  def initialize(rest_insp_data)
    @name = rest_insp_data[:dba]
    @zipcode = rest_insp_data[:zipcode]
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

  def self.rest_by_name(name)
    self.all.select{|rest|rest.name.downcase.include?(name.downcase)}
  end
end
