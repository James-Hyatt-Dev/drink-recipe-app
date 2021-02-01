class Drink
    attr_accessor :names, :ids

    @@all_names_and_ids = []

    def initialize(hash)

        @@all_names_and_ids << self
    end

    def self.all_names_and_ids
        @@all_names_and_ids
    end

end 