require_relative '../config/environment'

#Gets name of user
def user_name(name)
  User.all.each do |name|
   if user.name == name
     #check database for matching user name
     #if user name matches then return that User
     #else create new User object
   end
 end
#Do we need to do these actions in Ruby & in the database
#Ex. User.new vs. User.create

end

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
       input_meal
    elsif answer == "2"
       check_meal
      puts "check meal method"
    elsif answer == "3"
      puts "Goodbye"
    else
      puts "Not a valid choice. Please try again."
      return_home
    end
  end

 #Gets User's meal data
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

 #Creates a new meal instance based on User inputs
  def create_new_meal(food,calories,sugar,salt,carbs,protein)
    Meal.new(food: food, calories: calories, sugar: sugar, salt: salt, carb: carbs, protein: protein)
  end

 #Helper method for check meals
  def get_meals
    UserMeal.all.select do |user_meal|
        user_meal.user == self
      end
  end

 #Gets all the meals belonging to the User
  def check_meals
    self.get_meals.map do |user_meals|
      user_meals.meal
    end
  end

#Returns User to home screen
  def return_home
    welcome
    menu_options
  end

  welcome
  menu_options

  #+++++++TOMORROW+++++++

  #Delete existing database tables.
  #Repopulate database tables.
  #Ask question about how do we return and feed data to the database
  #especially after a user inputs their meal information.
  #Figure out time zone in our welcome method
  
