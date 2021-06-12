class WhitneyExhibitions::Exhibitions
  attr_accessor :name
  attr_writer :dates
  
  @@all = []
  
  def initialize(name)
    @name = name
    @dates = []
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    WhitneyExhibitions::Scraper.scrape_exhibitions if @@all.empty?
    @@all
  end
  
  def self.dates
    WhitneyExhibitions::Scraper.scrape_dates if @dates.empty?
    @dates
  end
  
end