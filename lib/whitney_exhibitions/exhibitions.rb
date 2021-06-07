class WhitneyExhibitions::Exhibitions
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    WhitneyExhibitions::Scraper.scrape_exhibitions if @@all.empty?
    @@all
  end
  
end