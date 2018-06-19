require_relative '../config/environment'

#to get chart info from api...
#CLIENT.call(day, month, year, hour, minute, lat, long, timezone)

#Models for signs, planets, users, joiner table

#ways to continue prompting user to do stuff until the exit

puts "~welcome~to~astroCLI~"
options
choice = gets.chomp

case choice
when "add"
  name = get_name
  new_person = User.create(name: name)
  date = get_birthday
  time = get_birthtime
  place = get_birthplace
  birthchart = get_birthchart(date, time, place)
  save_chart(birthchart, new_person)
when "view"
  print_users
  puts "Select a name"
  name = gets.chomp
  select_chart(name)

when "compare"

when "exit"
 puts "goodbye"
else
  puts "enter a valid command"
  options
  choice = gets.chomp
end
