class User < ActiveRecord::Base
  has_many :user_meals
  has_many :meals, through: :user_meals

  #works but is not linked to EST
  def welcome
    	logtime = Time.now.hour
    	case
    	when logtime > 0 && logtime < 11
    		puts "Good morning!"
    	when logtime > 12 && logtime < 15
    		puts "Good afternoon!"
    	when logtime > 16 && logtime < 21
    		puts "Good night!"
    	when logtime > 22 && logtime < 23
    		puts "NO EATING THIS LATE"
      else
        puts "Please try again."
    	end
    end

   #Gets User's choice
    def get_user_choice
    	gets.chomp
    end

   #Presents User with menu options
    def menu_options
    	puts "What would you like to do? Enter a number to pick your option"
    	puts "1. Input Meal\n
    		  2. Check Meals\n
    		  3. Exit"
    		answer = get_user_choice
    		what_to_do(answer)
    end

  #Performs an action based on User selection
    def what_to_do(answer)
    	if answer == "1"
  			#input_meal
  			puts "input meal method"
  		elsif answer == "2"
  			#check_meal
  			puts "check meal method"
  		elsif answer == "3"
  			#exit application
  			puts "Goodbye!"
  		else
  			puts "Not a valid choice."
    	end
    end

    def input_meal
       puts "Please enter the name of your meal:"
       food = gets.chomp
       puts "Please enter your meal calories:"
       calories = gets.chomp
       puts "Please enter your sugar intake:"
       sugar = gets.chomp
       puts "Please enter your salt intake:"
       salt = gets.chomp
       puts "Please enter your carb intake:"
       carbs = gets.chomp
       puts "Please enter your protein intake:"
       protein = gets.chomp
 	  end

    def create_new_meal(food,calories,sugar,salt,carbs,protein)
      Meal.new(food: food, calories: calories, sugar: sugar, salt: salt, carb: carbs, protein: protein)
    end

    def get_meals
      UserMeal.all.select do |user_meal|
          user_meal.user == self
        end
    end
    
    def check_meals
      self.get_meals.map do |user_meals|
        user_meals.meal
      end
    end


 end
