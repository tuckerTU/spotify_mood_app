class API
    
    def self.api_call(url)
        token = ENV["AUTH_TOKEN"]
        uri = URI(url) 
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        return JSON(response.body) # <!DOCTYPE html> ... </html> => nil 
    end

    def self.find_playlist_by_id(id)
        playlist_hash = api_call("https://api.spotify.com/v1/playlists/#{id}")
        playlist = Playlist.find_or_create(playlist_hash["name"], playlist_hash["id"])
        playlist_hash["tracks"]["items"].each do |song_hash| 
            Song.find_or_create({artist_name: song_hash["track"]["artists"][0]["name"],id: song_hash["track"]["id"], name: song_hash["track"]["name"], popularity:song_hash["track"]["popularity"], playlist:playlist})
        end
    end

end 

 