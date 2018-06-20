class Session < ActiveRecord::Base
	belongs_to :user

	def get_name
	user_name = gets.chomp
	User.find_or_create_by(name: user_name)
	end	

	# Pry.start


end