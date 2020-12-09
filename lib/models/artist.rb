class Artist
    attr_accessor :name, :artist, :song 
    @@all = []

    def initialize(name, artist, song)
        @@name = name 
        @@artist = artist 
        @@song = song 
        self.class.all << self
    end

    def self.all 
        @@all 
    end

end