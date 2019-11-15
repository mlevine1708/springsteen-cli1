module Springsteen
class CLI 
  
 def call
   puts "Welcome to the Bruce Springsteen CLI!"
   start 
 end
 
   
 def start 
   puts "Would you like to see a list of Bruce Springsteen's albums? Enter Yes or No."
   input = ""
   input = gets.strip 
      if input == "Yes"  
        load_albums
        get_album
        sleep 5
        puts "Would you like to see another one?"
    input = ""
    input = gets.strip 
      if input == "Yes"
        start     
      elsif input == "No"
        puts ""
        puts "Thank you for visiting!"
        exit 
      else 
        puts "I don't understand that answer."
        call 
      end
    end
  end 
 

  def load_albums
   @albums = Springsteen::Album.all
   @albums.each.with_index(1) do |album, index| 
      puts "#{index}. #{album.title}"
   end
  end
 
  def get_album
    puts "Which album would you like to learn about?"
    input = gets.strip.to_i
    chosen_album = Springsteen::Album.all[input -1]
    Springsteen::Scraper.scrape_descriptions(chosen_album) 
    puts chosen_album.info 
    puts chosen_album.notes 
    puts chosen_album.release_date
    puts chosen_album.label 
    puts chosen_album.producer
    end
  end 
  
  
  
  def album
     @albums = Springsteen::Album
    @albums.each.with_index(1) do |album, i|
      puts "#{i}. #{album.title} - #{album.date} - #{album.url}"
    end
  end

end 
