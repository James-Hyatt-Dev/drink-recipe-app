class Api 

    @@apikey = "9973533"
    
    def self.get_drink_by_liquor(liquor)
        url = "https://www.thecocktaildb.com/api/json/v2/#{@@apikey}/filter.php?i=#{liquor.capitalize}"
        response = HTTParty.get(url)
        liquor_name_array = response["drinks"].each {|j| j.delete("strDrinkThumb")}
        # binding.pry
        liquor_name_array.each do |drink|
            Drink.new(drink)
            # binding.pry
        end
            
    end

    def self.get_drink_by_name(drink)
        url = "https://www.thecocktaildb.com/api/json/v2/#{@@apikey}/search.php?s=#{drink.capitalize}"
        response = HTTParty.get(url)
        binding.pry
        recipe_array = response {}
        # binding.pry
        #something
    end




end
