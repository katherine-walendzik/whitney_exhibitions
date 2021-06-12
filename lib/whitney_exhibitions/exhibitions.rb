class WhitneyExhibitions::Exhibitions
  attr_accessor :name, :dates
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
  
  def get_dates
    WhitneyExhibitions::Scraper.scrape_dates(self) if @dates.empty?
  end
  
end