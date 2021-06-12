class WhitneyExhibitions::Dates
  attr_accessor :range, :exhibition
  @@all = []
  
  def initialize(range)
    @range = range
    save
  end
  
  def save
    @@all << self
  end
  
end