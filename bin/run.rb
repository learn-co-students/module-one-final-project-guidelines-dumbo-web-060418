require_relative '../config/environment'
require 'pry'
require 'terminal-table'

controller = MealController.new
controller.welcome
controller.menu_options

 #Things to Add

 #delete_user  Deletes the user
