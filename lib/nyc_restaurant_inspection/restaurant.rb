class NYCRestaurantInspection::Restaurant

  attr_accessor :name, :zip_code, :violation_description, :grade

  @@all = []

  def initialize(rest_insp_data)
    @name = rest_insp_data[:dba]
    @zip_code = rest_insp_data[:zip_code]
    @violation_description = rest_insp_data[:violation_description]
    @grade = rest_insp_data[:grade]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.rest_by_zip_code(zip_code)
    self.all.select{|rest| rest.zip_code == zip_code}
  end

  def self.rest_by_name(name)
    self.all.select{|rest_n| rest_n.name.include?(name)}
  end
end
