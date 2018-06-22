require_relative '../config/environment'
require 'pry'
require 'terminal-table'

pid = fork{ exec 'afplay', "media/PokeThemes2.mp3"}

controller = MealController.new
controller.welcome
controller.menu_options

pid = fork{ exec 'killall', "afplay" }

 #Things to Add

 #delete_user  Deletes the user
