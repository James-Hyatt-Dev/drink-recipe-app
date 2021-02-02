class Drink

    self.attr_accessor :name, :id

    @@all_drinks = []

    def initialize(hash)
        # binding.pry
        hash.each do |k,v|
            self.send("#{k}=", "#{v}") if self.respond_to?("#{k}=")
        end
        @@all_drinks << self
        # binding.pry
    end

    def self.all_drinks
        @@all_drinks
    end

end 