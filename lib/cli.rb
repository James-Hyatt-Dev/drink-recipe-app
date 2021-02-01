class Cli   

    def welcome
        puts ""
        puts "Welcome to our CLI drink recipe app! We have over 600+ drinks and 480+ ingrediates to share with you!"
        self.ask_for_drink_or_input
    end

    def ask_for_drink_or_input
        puts ""
        puts "Please make a selection to get started."
        puts ""
        puts "1. Choose from the top 10 drinks World Wide"
        puts "2. Give us a liquor to find drinks and their recipes." 
        input = gets.strip
        self.input_from_step_1(input)
    end

    def input_from_step_1(input)
        # input = gets.strip
        if input == "1" || input.include?("choose") || input.include?("Choose") || input.include?("top") || input.include?("Top")
            self.top_ten_drinks
        elsif input == "2" || input.include?("recipe") || input.include?("Recipe") || input.include?("liquor") || input.include?("Liquor")
            self.request_from_liquor
        else 
            puts "That selection was invalid, please sleect either 1 or 2."
            self.ask_for_drink_or_input
        end
    end

    def top_ten_drinks
        puts ""
        puts "1. Mojito"    
        puts "2. Old Fashioned"  
        puts "3. Long Island Tea"    
        puts "4. Negroni"    
        puts "5. Whisky Sour"
        puts "6. Dry Martini"   
        puts "7. Daiquiri"    
        puts "8. Margarita"  
        puts "9. Manhattan"  
        puts "10. Moscow Mule"
        puts ""
        input = gets.strip
        self.send_top_ten_drinks_to_api(input)
    end

    def send_top_ten_drinks_to_api(input)
        top_ten = {"1" => "Mojito", "2" => "Old-Fashion", "3" => "Long-Island-Tea", "4" => "Negroni", "5" => "Whisky-Sour", "6" => "Dry-Martini", "7" => "Daiquiri", "8" => "Margarita", "9" => "Manhattan", "10" => "Moscow-Mile"}
        new_drink = Api.get_drink_by_name(top_ten[(input)])
    binding.pry
    end



    def request_from_liquor
        puts "Please enter a type of liquor to see a list of drinks"
        puts ""
        puts "Spelling is of vital importance, double check your spelling"
        puts ""
        puts "Remember, we are now asking for liquor types(Vodka, Gin etc.), not brands(Grey Goose, Captain Morgan etc.)"
        puts ""
        #needs to send the input to the url for the api response
        input = gets.strip
        new_drink = Api.get_drink_by_liquor(input)
    end
end

