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
  
end