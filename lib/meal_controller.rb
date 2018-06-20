class MealController < ActiveRecord::Base
	belongs_to :user

def get_name
	puts "Please enter username"
	user_name = gets.chomp
	user = User.find_or_create_by(name: user_name)
	self.update(user_id: user.id)
end

def welcome
    get_name
    logtime = Time.now.hour
    case logtime
    when 0..11
      puts "Good morning!"
    when 12..15
      puts "Good afternoon!"
    when 16..21
      puts "Good night!"
    when 22, 23
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
    puts "1. Input Meal"
    puts "2. Check Meals"
    puts "3. Update Meals"
		puts "4. Delete Meals"
		puts "5. Exit"
      answer = get_user_choice
      what_to_do(answer)
  end

#Performs an action based on User selection
  def what_to_do(answer)
    if answer == "1"
       input_meal
    elsif answer == "2"
       check_meals
    elsif answer == "3"
       update_meals
		elsif answer == "4"
       delete_meal
		elsif answer == "5"
			 puts "Goodbye!"
    else
      puts "Not a valid choice. Please try again."
      return_home
    end
  end

 #Gets User's meal data
  def input_meal
     puts "Please enter the name of your meal:"
     food = gets.chomp #should make sure a string is entered and eventually be editable
    		puts "Please enter your meal calories (Press 1 to return to menu):"
    		calories = gets.chomp

    		puts "Please enter your sugar intake:"
    		sugar = gets.chomp
    		puts "Please enter your salt intake:"
    		salt = gets.chomp
    		puts "Please enter your carb intake:"
    		carbs = gets.chomp
    		puts "Please enter your protein intake:"
    		protein = gets.chomp
    	 #implement way to re-input values for meal

    	 meal = create_new_meal(food,calories,sugar,salt,carbs,protein)
    	 UserMeal.create(user_id: self.user_id, meal_id: meal.id)
    	 menu_options

   end


 #Creates a new meal instance based on User inputs
  def create_new_meal(food,calories,sugar,salt,carbs,protein)
    Meal.create(food: food, calories: calories, sugar: sugar, salt: salt, carbs: carbs, protein: protein)
  end

 #Gets all the meals belonging to the User
  def check_meals
    user.meals.each do |meal|
       puts meal
		end
		menu_options
  end

	#Gets user's updated meal information
	def my_meal_update_questions
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

 #Updates a part or all of a user's meal instance
	def update_meals
		puts "Enter the name of the meal you want to update:"
    meal_name = gets.chomp
    my_meal = user.meals.find_by(food:meal_name)
		my_meal_update_questions
		Meal.update(user_id: self.user_id, calories: calories, sugar: sugar, salt: salt, carbs: carbs, protein: protein)
    binding.pry
	end

	#Deletes a user's meal instance
 	def delete_meal
 		puts "Enter the name of the meal you want to delete:"
     meal_name = gets.chomp
     user.meals.select do |meal|
        if meal.food == meal_name
           meal.delete
					 puts "Your meal has been deleted."
 			end
 		end
 	end

#Returns User to home screen
  def return_home
    welcome
    menu_options
  end

  #+++++++NEXT UP+++++++

  #Give users the ability to delete their meal entry
	#and/or all associated meals.
	#Give users the ability to update their meal entry

	# if calories == "1"
	# 	menu_options
	# end


end
