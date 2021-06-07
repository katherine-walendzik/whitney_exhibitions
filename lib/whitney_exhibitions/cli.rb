class MetExhibits::CLI
  
  
  
  def call
    puts "\nWelcome to the Metropolitan Museum of Art's current exhibitions!\n"
    get_exhibits
    list_exhibits
    get_user_exhibit
  end
  
  
  
  def get_exhibits
    #scrape
    @exhibits = MetExhibits::Exhibits.all
  end
  
  
  
  def list_exhibits
    puts "\nPlease select the number of the exhibition that you would like to visit:\n"
    @exhibits.map.with_index(1) do |exhibit, i|
      puts "#{i}. #{exhibit.name}"
    end
  end
  
  
  
  def get_user_exhibit
    selected_exhibit = gets.strip.to_i
    
    #refactor to one line when code passes
    
    if valid_input(selected_exhibit, @exhibits)
      display_info_for(selected_exhibit) 
    else puts "Please select a number corresponding to a current exhibition."
      #loop back to select input
    end
    
  end
  

  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
  
  
  
  def display_info_for(selected_exhibit)
      #scrape for corresponding data
      exhibit = @exhibits[selected_exhibit - 1]
      puts "Details for #{exhibit.name}:"
      #display as list on separate lines
      #{:end_date => "#{end_date}", :location => "#{location}"}
  end
  
  
  
end