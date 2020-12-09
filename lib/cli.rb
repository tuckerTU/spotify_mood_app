class CLI
    PLAYLISTS = {
        "Chill" => "37i9dQZF1DX889U0CL85jj",
        "Angry" => "36lqaSvXXuBxi3oYIaEI4B",
        "Groovy" => "3Xt0duCIylMNefC4WmjiYt",
        "Romantic" => "2PV8zQaMhtLjQ5H2z7Js4E",
        "Depressed" => "2Hkk04yn1uNBxQwEql433E",
        "Happy" => "6HWkP17KelQ2PYotO3Usaw",
        "Pumped Up" => "6BC5W6YXCqyPrHDDwQhJlE",
        "Melancholy" => "5CyR6yCIZQwRdSJSjC5ssl"
    }

    def initialize
        @rspotify = Rspotify.new
        @rspotify.authenticate
    end

    def start 
        welcome
        display_moods
        mood_selection
        @rspotify.return_random_song() 
    end

    def welcome 
        puts "Welcome to the Mood app!"
    end

    def display_moods 
        puts "Here are some moods:"
        PLAYLISTS.keys.each.with_index(1) do |key, index|
            puts "#{index}. #{key}"
        end
    end

    def mood_selection 
        puts "How are you feeling? Type the corresponding number!"
        local_input = gets.strip.to_i
        if local_input.between?(1, PLAYLISTS.keys.length) 
            mood = PLAYLISTS.keys[local_input - 1]
            playlist_id = PLAYLISTS[mood]
            API.find_playlist_by_id(playlist_id)
        else
            puts "Hmm... unfortunately, that's not an option."
            mood_selection
        end
    end

end