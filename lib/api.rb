class Api 

    @@apikey = "9973533"
    
    def self.get_drink_by_liquor(liquor)
        url = "https://www.thecocktaildb.com/api/json/v2/#{@@apikey}/filter.php?i=#{liquor}"
        response = HTTParty.get(url)
        liquor_name_array = response["drinks"].each {|j| j.delete("strDrinkThumb")}
        liquor_name_array.each do |drink|

    #     names = response["drinks"][0].select do |k,v|
    #         k.include?("strDrink")
    #     end.values.select do |j|
    #         j == j
    # end

        # liquor_name_array = {
        #     liquor: "#{liquor}", 
        # names: name, 
        # ids: id
    # }
            binding.pry
            Drink.new(liquor_name_array)
        end
            
    end

    def self.get_drink_by_name(drink)
        url = "https://www.thecocktaildb.com/api/json/v2/#{@@apikey}/search.php?s=#{drink}"
        response = HTTParty.get(url)
        ingredients = response["drinks"][0].select do |k,v|
            k.include?("strIngredient")
        end.values.select do |j|
            j 
        end
        measurements = response["drinks"][0].select do |k,v|
            k.include?("strMeasure")
        end.values.select do |j|
            j 
        end

        recipe_array = {
            glass: response["drinks"][0]["strGlass"], 
            instructions: response["drinks"][0]["strInstructions"], 
            ingredients: ingredients, amounts: measurements, 
            name: response["drinks"][0]["strDrink"]
        }
        Recipe.new(recipe_array)
            

    end
    
    


end