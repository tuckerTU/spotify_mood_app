class CLI
    PLAYLISTS = {
        "Chill" => "37i9dQZF1DX889U0CL85jj",
        "Angry" => "36lqaSvXXuBxi3oYIaEI4B",
        "Groovy" => "3Xt0duCIylMNefC4WmjiYt",
        "Romantic" => "2PV8zQaMhtLjQ5H2z7Js4E",
        "Happy" => "6HWkP17KelQ2PYotO3Usaw",
        "Pumped Up" => "6BC5W6YXCqyPrHDDwQhJlE",
        "Melancholy" => "5CyR6yCIZQwRdSJSjC5ssl"
    }

    def start 
        welcome
        display_playlists
        user_selection
    end

    def welcome 
        puts "Welcome to my app!"
    end

    def display_playlists 
        puts "Here's a list of our playlists:"
        PLAYLISTS.keys.each.with_index(1) do |key, index|
            puts "#{index}. #{key}"
        end
    end

    def user_selection 
        puts "What's your mood? Type the corresponding number!"
        local_input = gets.strip.to_i
        if local_input.between?(1, PLAYLISTS.keys.length) 
            mood = PLAYLISTS.keys[local_input - 1]
            playlist_id = PLAYLISTS[mood]
            API.find_playlist_by_id(playlist_id)
        else
            puts "Wrong input! Please type one of the given numbers."
            user_selection
        end
    end

end