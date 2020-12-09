require 'dotenv/load'
require 'rspotify'

class API
    def self.api_call(url)
        token = "BQBhGi8xx6d-CzZ_smB9OPCF-09XZFd1Xa_FRpmw3UabKtZDfWrZ4A7nqOTIZLsaqmJLnMmFTXGQK7VMgB_U-dBky1NIkOM-ozESFioFWR7169pPiuzVXptfR9dbsR1styZzpcS4BWIc3C_qg84hPOgmUtR00xu_hNmtAy1_q5B4LX0"
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

