require 'dotenv/load'
require 'rspotify'

class API
    def self.api_call(url)
        token = "BQA11EMTLvRn0chycT7ZZkrnUjDeVYsd1e4t02tcYSCng0-444Em4VzbXf23rqjfySYBZV1385MC-m-EFH9VXHrKC8Bgm7ymLf96gmLN_3A1hLL42jfBwq2PDhP6kJLnmVhCyPWHRMPY7dngdGze-KvETws5RxC2NV1f29IAYEOPpek"
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
        playlist_hash["tracks"]["items"].collect do |song_hash| 
        #    Song.find_or_create({id: song_hash["track"]["id"], name: song_hash["track"]["name"], popularity:song_hash["track"]["popularity"], playlist:playlist})
        end
    end
end 

