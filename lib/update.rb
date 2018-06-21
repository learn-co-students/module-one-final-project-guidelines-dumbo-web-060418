def update
  clear
  puts "Which would you like to update? Type 'name' to change a user's name or 'chart' to change a user's chart"
  puts "type 'return' to return to the main menu"
  puts_space
  choice = gets.chomp.strip

  if choice == "return"
    clear
    return
  elsif choice == "name"
    update_name
  elsif choice == "chart"
    update_chart
  else
    puts "That is not a valid choice"
    puts_space
    update
  end
end

def update_chart
  clear
  puts "Select a chart to update"
  print_users
  puts_space
  name = gets.chomp.strip
  puts_space

  if name == "return"
    clear
    update
  elsif !User.all_names.include?(name)
    puts "That user does not exist"
    update_chart
  else
    user = User.find_by(name: name)
    user.delete_chart
    date = get_birthday
    birthchart = get_birthchart(date)
    save_chart(birthchart, user)
  end
end

def update_name
  clear
  puts "Type in the user's name you would like to change"
  puts_space
  print_users
  puts_space
  old_name = gets.chomp.strip
  puts_space

  if old_name == "return"
    clear
    update
  elsif !User.all_names.include?(old_name)
    puts "That user does not exist"
    update_name
  else
    puts "Type in the name you would like to change to"
    puts_space
    new_name = gets.chomp.strip
    puts_space

    if new_name == "return"
      clear
      update
    else
      User.update_name(old_name, new_name)
      puts "Name has been updated to #{new_name}"
    end
  end
end
