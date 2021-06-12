class WhitneyExhibitions::CLI
  
  def call
    puts "\nWelcome to the Whitney Museum of American Art's current exhibitions!"
    get_exhibitions
    list_exhibitions
    get_user_exhibition
  end
  
  def get_exhibitions
    @exhibitions = WhitneyExhibitions::Exhibitions.all
  end
  
  def list_exhibitions
    puts "\nPlease select the number of the exhibition that you would like to visit:"
    @exhibitions.map.with_index(1) do |exhibition, i|
      puts "#{i}. #{exhibition.name}\n"
    end
  end
  
  def get_user_exhibition
    selected_exhibition = gets.strip.to_i
    
    if valid_input(selected_exhibition, @exhibitions)
      display_info_for(selected_exhibition) 
    else puts "\nPlease select a number corresponding to a current exhibition."
      get_user_exhibition
    end
    
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
  
  
  
  def display_info_for(selected_exhibition)
      exhibition = @exhibitions[selected_exhibition - 1]
      dates = exhibition.dates
      puts "\nDates for #{exhibition.name}:"
      
      #WhitneyExhibitions::Exhibitions.all.map.with_index(1) do |exhibition|
      #  puts exhibition dates
      #end
  end
  
  
  
end