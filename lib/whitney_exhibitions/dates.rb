class WhitneyExhibitions::Dates
  attr_accessor :range, :exhibition
  @@all = []
  
  def initialize(range,exhibition)
    @range = range
    @exhibition = exhibition
    save
  end
  
  def save
    @@all << self
  end
  
  def add_to_exhibition
    @exhibition.dates << self unless @exhibition.dates.include?(self)
  end
  
  def self.all
    WhitneyExhibitions::Scraper.scrape_dates if @@all.empty?
    @@all
  end
  
end