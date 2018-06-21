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
      puts "Up so late!"
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
    	 #implement way to re-input values for meal

    	 meal = create_new_meal(food,calories,sugar,salt,carbs,protein)
       self.user.meals << meal
    	 # UserMeal.create(user_id: self.user_id, meal_id: meal.id)
    	 menu_options
   end


 #Creates a new meal instance based on User inputs
  def create_new_meal(food,calories,sugar,salt,carbs,protein)
    Meal.create(food: food, calories: calories, sugar: sugar, salt: salt, carbs: carbs, protein: protein)
  end

 #Gets all the meals belonging to the User
  def check_meals
    new_user = User.find(self.user.id)
       puts "| Food | Calories | Sugar | Salt | Carbs | Protein |"
    new_user.meals.each do |meal|
       puts "| #{meal.food} | #{meal.calories} | #{meal.sugar} | #{meal.salt} | #{meal.carbs} | #{meal.protein} |"  #should print out all values for this meal instance
		end
		menu_options

  end

 #Updates a part or all of a user's meal instance
	def update_meals
    puts "Enter the name of the meal you want to update:"
    meal_name = gets.chomp
		  new_user = User.find(self.user.id)
		  # new_user.meals.select do |meal|
			# if meal.food == meal_name
				my_meal = Meal.find_by(food: meal_name)
			if my_meal
				puts "Enter the name of the new meal"
		    new_meal_name = gets.chomp
		    puts "New calories?"
		    new_calories = gets.chomp
		    puts "New sugar?"
		    new_sugar = gets.chomp
		    puts "New salt?"
		    new_salt = gets.chomp
		    puts "New carbs?"
		    new_carbs = gets.chomp
		    puts "New protein?"
		    new_protein = gets.chomp
	      my_meal.update(food: new_meal_name, calories: new_calories, sugar: new_sugar, salt: new_salt, carbs: new_carbs, protein: new_protein)
				puts "Successfully updated #{meal_name}"
		 else
			  puts "There is no meal that matches that name. Please try again."
	   end
		 menu_options
	 # end


end

	#Deletes a user's meal instance
 	def delete_meal
 		puts "Enter the name of the meal you want to delete:"
     meal_name = gets.chomp
		   new_user = User.find(self.user.id)
			 # meal = Meal.find_by(food:meal_name)

			 meal = new_user.meals.find {|meal| meal.food == meal_name}
		   # new_user.meals.each do |meal|
		     if meal
					 	meal.destroy
						puts "Your meal has been deleted."
					else
						puts "Your meal does not exist."
				 end
			 # end
			 menu_options
		end


#Returns User to home screen
  def return_home
    welcome
    menu_options
  end

  #+++++++NEXT UP+++++++
  #AFTERNOON
  #work on control flow of the logic

  #~*~****~*~ FUN STUFF *~*~*~~~~*~***
  #create table that returns for the user when they check their meals (#check_meals)

end
