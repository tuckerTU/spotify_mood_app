require 'pry'

class Song

@@all = []

    def initialize(hash)
        hash.each do |k, v|
            self.class.attr_accessor k
            self.send("#{k}=", v)
        end
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        all.find do |song|
            song.name == name 
        end
    end

    def self.find_or_create(hash) 
        find_by_name(hash[:name]) || new(hash)
    end

    def display_song
        puts "#{self.artist_name}- \"#{self.name}\"" 
    end

    def self.return_artist_songs(artist)
       song_array = all.select do |song|
          song.artist_name.casecmp? artist
        end
        song_array.each do |song|
            puts "\"#{song.name}\""
        end
     end

end