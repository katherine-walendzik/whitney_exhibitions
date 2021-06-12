class WhitneyExhibitions::Scraper
  
  
  
  
  def self.scrape_exhibitions
    
    doc = Nokogiri::HTML(URI.open("https://whitney.org/exhibitions"))

    list_one = doc.css("div.exhibitions__list h2")
    list_two = doc.css("div.exhibitions__list h3")
  
    edit = list_two.collect{|e| e.text}
    list_two_edit = edit.drop(2)

    master_list = list_one.text + list_two_edit.join
    exhibitions = master_list.split(/\n+/)
    #need to remove empty elements in array
    
    exhibitions.each do |e|
      name = e.strip
      WhitneyExhibitions::Exhibitions.new(name)
    end
    
  end
  
  
  
  
  def self.scrape_dates(exhibition)
    
    doc = Nokogiri::HTML(URI.open("https://whitney.org/exhibitions"))
  
    set_one = doc.css("div.exhibitions__list h3") 
    set_two = doc.css("div.exhibitions__list h4")
    
    edit = set_one.collect{|e| e.text}
    set_one_edit = edit.slice(0, 2) 
    
    full_set = set_one_edit.join + set_two.text
    dates = full_set.split(/\n+/)
    
    dates.each do |d|
      dates = d.strip
      WhitneyExhibitions::Dates.new(dates, exhibition)
    end
    
    #outputing full list of dates instead of individual
    
  end
  
  
  
  
end