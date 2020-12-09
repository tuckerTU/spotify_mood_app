require 'rspotify'
require_relative '../environment'

class Rspotify

    def initialize 
        
    end

    def authenticate 
        RSpotify.authenticate(ENV['CLIENT_ID'], ENV['CLIENT_PASSWORD'])
    end

    def return_random_song(username, playlist_id) 
        playlist = RSpotify::Playlist.find(username, playlist_id)
        random = rand(playlist.tracks.length)
        artist_name = playlist.tracks[random].artists[0].name
        song_name = playlist.tracks[random].name
        puts "#{artist_name}- \"#{song_name}\"" 
        binding.pry
    end
    
end


rspotify = Rspotify.new
rspotify.authenticate
rspotify.return_random_song('kaythalex_', '3Xt0duCIylMNefC4WmjiYt')