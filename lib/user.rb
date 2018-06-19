class User < ActiveRecord::Base
  has_many :user_meals
  has_many :meals, through: :user_meals

  def welcome
  	time = Time.now
  	case time
  	when time.hour == 0..11
  		puts "Good morning!
  	when time.hour == 12..15
  		puts "Good afternoon!"
  	when time.hour == 16..21
  		puts "Good night!
  	when time.hour == 22..24
  		puts "NO EATING THIS LATE"
  	end
  end

  def menu_options
  	puts "What would you like to do? Enter a number to pick your option"
  	puts "1. Input Meal\n 
  		  2. Check Meals\n
  		  3. Exit"
  		  get_user_choice
  		if get_user_choice = 1
  			input_meal
  		elsif get_user_choice = 2
  			check_meal
  		elsif get_user_choice = 3 
  			#exit application
  			puts "Goodbye!"
  		else
  			"Not a valid choice"
  		end
  end

  		
  end

  	def get_user_choice
  	choice = gets.chomp 
  	end

  	def input_meal

 	end

  	def check_meal

  	end
  

 end


	
