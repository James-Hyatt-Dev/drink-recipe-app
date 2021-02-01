class Api 

    @@apikey = "9973553"
    
    def self.get_drink_by_liquor
        url = "https://www.thecocktaildb.com/api/json/v2/#{@@api_key}/filter.php?i=#{liquor}"
        response = HTTParty.get(url)
        liquor_name_hash = 
        Drinks.new(liquor_name_hash)
    end
    

end
