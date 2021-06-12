class WhitneyExhibitions::Scraper
  
  def self.scrape_exhibitions
    uri = "https://whitney.org/exhibitions"
    doc = Nokogiri::HTML(URI.open(uri))
    exhibitions = doc.css("div.exhibitions__list").text
    second_exhibitions = doc.css("div.exhibitions__list h3").text.rstrip
    binding.pry
  end
  
end