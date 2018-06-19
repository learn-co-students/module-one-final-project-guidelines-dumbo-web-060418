class User < ActiveRecord::Base
  has_many :user_meals
  has_many :meals, through: :user_meals

  def welcome
  	time = Time.now
  	case time
  	when time.hour == 0..11
  		puts "Good morning!"
  	when time.hour == 12..15
  		puts "Good afternoon!"
  	when time.hour == 16..21
  		puts "Good night!"
  	when time.hour == 22..24
  		puts "NO EATING THIS LATE"
  	end
  end

  def menu_options
  	puts "What would you like to do? Enter a number to pick your option"
  	puts "1. Input Meal\n 
  		  2. Check Meals\n
  		  3. Exit"
  		answer = gets.chomp 
  		get_user_choice
  		what_to_do(answer)
  end

  def get_user_choice
  	gets.chomp 
  	end

  def what_to_do
  	if answer == 1
			input_meal
			puts "input meal method"
		elsif answer == 2
			check_meal
			puts "check meal method"
		elsif answer == 3 
			#exit application
			puts "Goodbye!"
		else
			puts "Not a valid choice."
  	end
  end
 

  	

  # 	def input_meal

 	# end

  # 	def check_meal

  	# end
  

 end


	
