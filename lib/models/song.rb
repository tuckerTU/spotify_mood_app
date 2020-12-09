class Song
    attr_accessor :name, :song, :genre 
    @@all = []

    def initialize(name, song, genre)
        @name = name 
        @song = song 
        @genre = genre 
        self.class.all << self
    end

    def self.all 
        @@all
    end

end