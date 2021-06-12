class WhitneyExhibitions::Scraper
  
  def self.scrape_exhibitions
    
    uri = "https://whitney.org/exhibitions"
    doc = Nokogiri::HTML(URI.open(uri))

    list_one = doc.css("div.exhibitions__list h2")
    list_two = doc.css("div.exhibitions__list h3")
  
    edit = list_two.collect{|e| e.text}
    list_two_edit = edit.drop(2)

    master_list = list_one.text + list_two_edit.join
    exhibitions = master_list.split("\n")
    #need to remove empty elements in array
    
    exhibitions.compact.each do |e|
      name = e.strip
      WhitneyExhibitions::Exhibitions.new(name)
    end
    
  end
  
  def self.scrape_dates(exhibition)
    
    uri = "https://whitney.org/exhibitions"
    doc = Nokogiri::HTML(URI.open(uri))
  
    dates = doc.css("div.exhibitions__list h3") + doc.css("div.exhibitions__list h4")
    #first two outputs of first set of dates only
    
    dates.each do |d|
      dates = d.text.strip
      WhitneyExhibitions::Dates.new(dates, exhibition)
    end
    
  end
  
end