class WhitneyExhibitions::Scraper
  
  def self.scrape_exhibitions
    
    uri = "https://whitney.org/exhibitions"
    doc = Nokogiri::HTML(URI.open(uri))
    
    exhibitions = doc.css("div.exhibitions__list h2") + doc.css("div.exhibitions__list h3") #minus first two outputs
    
    exhibitions.each do |e|
      name = e.text.strip
      WhitneyExhibitions::Exhibitions.new(name)
    end
    
  end
  
  def self.scrape_dates#(exhibition)
    
    uri = "https://whitney.org/exhibitions"
    doc = Nokogiri::HTML(URI.open(uri))
  
    dates = doc.css("div.exhibitions__list h3") + doc.css("div.exhibitions__list h4")
    #first two outputs of first set of dates only
    
    dates.each do |d|
      dates = d.text.strip
      WhitneyExhibitions::Exhibitions.new(dates)
    end
    
  end
  
end