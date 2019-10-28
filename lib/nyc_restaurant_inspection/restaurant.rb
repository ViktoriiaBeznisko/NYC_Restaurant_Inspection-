class NYCRestaurantInspection::Restaurant

  attr_accessor :name, :zip_code, :violation_description, :critical_flag

  #ALLOWED_METHODS = Set[:to_s, :to_i, :upcase, :downcase]
  @@all = []

  def initialize(rest_insp_data)
    @name = rest_insp_data[:dba]
    @zip_code = rest_insp_data[:zip_code]
    @violation_description = rest_insp_data[:violation_description]
    @critical_flag = rest_insp_data[:critical_flag]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.get_rest_name
    self.all.collect{|rest_n| rest_n.name}
  end

  def self.rest_by_name(name)
    self.all.collect{|rest_n| rest_n.include?(name)}
  end


  def self.get_zip_code
    self.all.collect{|zip| zip.zip_code}.flatten.uniq
  end

  def self.rest_by_zip_code(number)
    zip_code = self.get_zip_code[number-1]
    restaurants = self.all.select{|rest|rest.name.include?(zip_code)}
  end
end
