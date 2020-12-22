class Playlist
    
    attr_accessor :name, :id

    @@all = []

    def self.all 
        @@all 
    end

    def initialize(name, id)
        @name = name
        @id = id 
        self.class.all << self
    end

    def self.find_by_id(id)
        all.find{|playlist| playlist.id == id}
    end

    def self.find_or_create(name, id)
        find_by_id(id) || new(name, id)
    end

    def songs 
        Song.all.select{|song| song.playlist == self}
    end

end 