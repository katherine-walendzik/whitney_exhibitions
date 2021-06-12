class WhitneyExhibitions::Dates
  attr_accessor :dates, :exhibition
  @@all = []
  
  def initialize(dates,exhibition)
    @dates = dates
    @exhibition = exhibition
    add_to_exhibition
    save
  end
  
  def save
    @@all << self
  end
  
  def add_to_exhibition
    @exhibition.dates << self unless @exhibition.dates.include?(self)
  end
  
  def self.all
    #WhitneyExhibitions::Scraper.scrape_dates if @@all.empty?
    @@all
  end
  
end