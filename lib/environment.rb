require_relative "./mood_app/version"
require 'net/http'
require 'json'
require 'pry'
require 'dotenv/load'
require 'rspotify'

require_relative "./api"
require_relative "./cli"
require_relative "./models/artist"
require_relative "./models/rspotify"
require_relative "./models/playlist"
require_relative "./models/song"


module MoodApp
  class Error < StandardError; end
  # Your code goes here...
end
