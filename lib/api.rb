class API

    
    token = ENV["AUTH_TOKEN"]
    uri = URI("https://api.spotify.com/v1/browse/categories/mood/playlists?offset=0&limit=50")
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{token}" 
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == "https")
    response = http.request(req)
    puts response.body["artists"] # <!DOCTYPE html> ... </html> => nil

end