class WhitneyExhibitions::Scraper
  
  def scrape_exhibitions
    uri = "https://whitney.org/exhibitions"
    doc = Nokogiri::HTML(URI.open(uri))
    exhibitions = doc.css("div.exhibitions__list h3").text.rstrip
    binding.pry
      puts exhibitions
  end
  
end