require 'dotenv/load'
class API
    def self.api_call(url)
        token = "BQDGl0bMMaSUw-eC6_8cX8xBMwz_roSM2UtjJE75a7JmC28xp0KhIuvM9jrPI-t2KvZqTSdPGGKgBBlQD8J4FcmjHuGKq1TierViDKCcY6-kycupoyE84yaN_95b9vb0HvgSvky_bASRwlqnAK1nk9183z70UV6t2mivyINBtkXcL1o"
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
        binding.pry
        playlist = Playlist.find_or_create(playlist_hash["name"], playlist_hash["id"])
        playlist_hash["tracks"]["items"].collect do |song_hash| 
        #    Song.find_or_create({id: song_hash["track"]["id"], name: song_hash["track"]["name"], popularity:song_hash["track"]["popularity"], playlist:playlist})
        end
    end
end 

