class NYCRestaurantInspection::Restaurant

  attr_accessor :name, :boro, :zip_code, :violation_description, :critical_flag
  @@all = []

  def initialize(rest_insp_data)
    @name = rest_insp_data[:dba]
    @boro = rest_insp_data[:boro]
    @zip_code = rest_insp_data[:zip_code]
    @violation_description = rest_insp_data[:violation_description]
    @critical_flag = rest_insp_data[:critical_flag]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.get_rest_name
    self.all.collect{|n|n.name}.flatten.uniq
  end

  def self.get_rest_viol_description(num)
    name = self.get_rest_name[num-1]
    viol_desc = self.all.select{|vd|vd.name.include?(name)}
  end
end

№
