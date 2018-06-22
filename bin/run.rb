require_relative '../config/environment'
require 'pry'
require 'terminal-table'

pid = fork{ exec 'afplay', "media/bensound-summer.mp3"}

controller = MealController.new
controller.welcome
controller.menu_options

 #Things to Add

 #delete_user  Deletes the user
