class Recipe  

    self.attr_accessor :glass, :instructions, :ingredients, :amounts, :name

    @@all_recipes = []

    def initialize(hash)
        hash.each do |k,v|
            self.send("#{k}=", "#{v}") if self.respond_to?("#{k}=")
        end
        @@all_recipes << self
        Cli.display_user_request

        binding.pry
    end

    def self.all_recipes
        @@all_recipes
    end



end
