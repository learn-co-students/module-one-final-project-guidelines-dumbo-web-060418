require_relative '../config/environment'
require 'pry'

# welcome
# get_name
# menu_options
controller = MealController.new
controller.welcome
controller.menu_options

binding.pry
