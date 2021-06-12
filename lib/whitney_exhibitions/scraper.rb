class WhitneyExhibitions::Scraper
  
  uri = "https://whitney.org/exhibitions"
  doc = Nokogiri::HTML(URI.open(uri))
  
  def self.scrape_exhibitions
    
    exhibitions = doc.css("div.exhibitions__list h2") + doc.css("div.exhibitions__list h3") #minus first two outputs
    
    exhibitions.each do |e|
      name = e.text.strip
      WhitneyExhibitions::Exhibitions.new(name)
    end
    
  end
  
  def self.scrape_dates
    
  end
  
end