class Drink
    attr_accessor :name, :id

    @@all_drinks = []

    def initialize(hash)
        self.name = hash["strDrink"]
        self.id = hash["idDrink"]
        @@all_drinks << self
    end

    def self.all_drinks
        @@all_drinks
    end

end 