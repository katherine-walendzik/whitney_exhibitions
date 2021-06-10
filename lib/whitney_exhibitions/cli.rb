class WhitneyExhibitions::CLI
  
  
  
  def call
    puts "\nWelcome to the Whitney Museum of American Art's current exhibitions!"
    binding.pry
    #get_exhibitions
    #list_exhibitions
    #get_user_exhibition
  end
  
  
  
  def get_exhibitions
    #scrape
    @exhibitions = WhitneyExhibitions::Exhibitions.all
  end
  
  
  
  def list_exhibitions
    puts "\nPlease select the number of the exhibition that you would like to visit:"
    @exhibitions.map.with_index(1) do |exhibition, i|
      puts "#{i}. #{exhibition.name}"
    end
  end
  
  
  
  def get_user_exhibition
    selected_exhibition = gets.strip.to_i
    
    #refactor to one line when code passes
    
    if valid_input(selected_exhibition, @exhibitions)
      display_info_for(selected_exhibition) 
    else puts "Please select a number corresponding to a current exhibition."
      #loop back to select input
    end
    
  end
  

  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
  
  
  
  def display_info_for(selected_exhibition)
      #scrape for corresponding data
      exhibition = @exhibitions[selected_exhibition - 1]
      puts "Details for #{exhibition.name}:"
      #display as list on separate lines
      #{:end_date => "#{end_date}", :location => "#{location}"}
  end
  
  
  
end