class API

    def self.get_playlists
        token = ENV["AUTH_TOKEN"]
        uri = URI("https://api.spotify.com/v1/users/dsf4hjjpafkyn3u98x6v3747v/playlists")
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        puts response.body["playlists"] # <!DOCTYPE html> ... </html> => nil
        binding.pry
    end
end 