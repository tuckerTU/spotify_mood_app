class Playlist
    attr_accessor :name, :id
    @@all = []

    def self.all 
        @@all 
    end

    def initialize(name, id)
        @name = name
        @id = id 
    end
end