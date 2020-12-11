require 'rspotify'
require_relative '../environment'

class Rspotify

    def authenticate 
        RSpotify.authenticate(ENV['CLIENT_ID'], ENV['CLIENT_PASSWORD'])
    end

    def return_random_song(username, playlist_id) 
        playlist = RSpotify::Playlist.find(username, playlist_id)
        random = rand(playlist.tracks.length)
        artist_name = playlist.tracks[random].artists[0].name
        song_name = playlist.tracks[random].name
        puts "#{artist_name}- \"#{song_name}\"" 
    end
    
end


