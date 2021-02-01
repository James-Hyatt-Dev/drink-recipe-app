class Api 

    @@apikey = "9973533"
    
    def self.get_drink_by_liquor(liquor)
        url = "https://www.thecocktaildb.com/api/json/v2/#{@@apikey}/filter.php?i=#{liquor.capitalize}"
        response = HTTParty.get(url)
        liquor_name_hash = response["drinks"].each {|j| j.delete("strDrinkThumb")}
        binding.pry
        Drink.new(liquor_name_hash)
    end


end
