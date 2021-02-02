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
        if input == "1" || input.include?("choose") || input.include?("Choose") || input.include?("top") || input.include?("Top")
            top_ten_drinks
        elsif input == "2" || input.include?("recipe") || input.include?("Recipe") || input.include?("liquor") || input.include?("Liquor")
            request_from_liquor
        else 
            puts "That selection was invalid, please selectt either 1 or 2."
            self.ask_for_drink_or_input
        end
    end

    def top_ten_drinks
        puts ""
        puts "1.  Mojito"    
        puts "2.  Old Fashioned"  
        puts "3.  Long Island Tea"    
        puts "4.  Negroni"    
        puts "5.  Mai Tai"
        puts "6.  Dry Martini"   
        puts "7.  Daiquiri"    
        puts "8.  Margarita"  
        puts "9.  Manhattan"  
        puts "10. Moscow Mule"
        puts ""
        puts "or... to change your mind to search by liquor, type in 'LIQUOR'"
        input = gets.strip
        self.user_input(input) 
    end

    def user_input(input)
        top_ten = {"1" => "Mojito", "2" => "Old Fashioned", "3" => "Long Island Tea", "4" => "Negroni", "5" => "Mai Tai", "6" => "Dry Martini", "7" => "Daiquiri", "8" => "Margarita", "9" => "Manhattan", "10" => "Moscow Mule"}
         if input == "1" || input == "mojito" || input == "Mojito" 
            new_recipe = Api.get_drink_by_name(top_ten["1"])
        elsif input == "2" || input == "old fashioned" || input == "Old fashioned" || input == "Old Fashioned" || input == "old" || input == "Old" 
            new_recipe = Api.get_drink_by_name(top_ten["2"])
        elsif input == "3" || input == "long island tea" || input == "Long island tea" || input == "Long Island Tea" || input == "long" || input == "Long" 
            new_recipe = Api.get_drink_by_name(top_ten["3"])
        elsif input == "4" || input == "negroni" || input == "Negroni" || input == "neg" || input == "Neg" || input == "negron" 
            new_recipe = Api.get_drink_by_name(top_ten["4"])
        elsif input == "5" || input == "Mai Tai" || input == "mai tai" || input == "Mai tai" || input == "Mai" || input == "mai" 
            new_recipe = Api.get_drink_by_name(top_ten["5"])
        elsif input == "6" || input == "dry martini" || input == "Dry Martini" || input == "Dry martini" || input == "Dry" || input == "dry" 
            new_recipe = Api.get_drink_by_name(top_ten["6"])
        elsif input == "8" || input == "margarita" || input == "Margarita" || input == "Marg" || input == "marg" || input == "margarit" 
            new_recipe = Api.get_drink_by_name(top_ten["8"])
        elsif input == "7" || input == "daiquiri" || input == "Daiquiri" || input == "Daquiri" || input == "daquiri" || input == "dag" 
            new_recipe = Api.get_drink_by_name(top_ten["7"])
        elsif input == "9" || input == "manhattan" || input == "Manhattan" || input == "manhatan" || input == "Manhatan" || input == "man" 
            new_recipe = Api.get_drink_by_name(top_ten["9"])
        elsif input == "10" || input == "moscow mule" || input == "Moscow Mule" || input == "Moscow mule" || input == "mule" || input == "mos" 
            new_recipe = Api.get_drink_by_name(top_ten["10"])
        elsif input == "LIQUOR"
            request_from_liquor
        else
            puts "Your input was invalid."
            self.ask_for_drink_or_input
        end
        self.recipe_display(new_recipe)
        # self.main_menu

    end

    def recipe_display(new_recipe)
        puts "All the wonderful information you requested for your drink, #{new_recipe.name}"
        puts ""
        puts "The recommended glass to use is a/an #{new_recipe.glass}"
        puts ""
        puts "The ingredients you will need are:"
        puts "#{new_recipe.ingredients}"
        puts ""
        puts "In the same order of the ingredients, the amounts of each are:"
        puts "#{new_recipe.amounts}"
        puts ""
        puts "Now the best part! Time to make your drink!"
        puts ""
        puts "#{new_recipe.instructions}"
        self.main_menu
    end

    

    
    def main_menu
        puts ""
            puts "If you wish to look up another recipe, please enter 1"
            puts ""
            puts "If you wish to exit the application, please enter 2"
            input = gets.strip
            if input == "1"
                self.ask_for_drink_or_input
            elsif input == "2"
                self.exit_application
            else
                puts "Invalid Input"
                self.main.menu
            end
        end

        def exit_application
            abort("Thank you for using our Drink Recipe Application! Have A Great Day!")
        end
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