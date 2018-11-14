def get_old_name
  update_name_menu
  old_name = gets.chomp.strip
  puts_space
  old_name
end


def get_new_name
  puts "Type in the name you would like to change to:"
  puts_space
  new_name = gets.chomp.strip
  puts_space
  new_name
end


def get_name_for_chart_update
  update_chart_menu
  name = gets.chomp.strip
  puts_space
  name
end


def update
  update_menu
  choice = gets.chomp.strip

  if choice == "return"
    clear
    return
  elsif choice == "name"
    clear
    update_name
    continue
  elsif choice == "chart"
    clear
    update_chart
    continue
  else
    clear
    puts "That is not a valid choice"
    puts_space
    update
  end
end


def update_chart
  name = get_name_for_chart_update

  if name == "return"
    clear
    update
  elsif !User.all_names.include?(name)
    clear
    puts "That user does not exist."
    update_chart
  else
    user = User.find_by(name: name)
    user.delete_chart
    birthday = get_birthday #raw input
    date = format_birthday(birthday) #splits it into an array to send to api, checks to see if date is valid
    birthchart = get_birthchart(date) #
    save_chart(birthchart, user)
    puts "#{name}'s chart has been updated"
  end
end


def update_chart_menu
  puts "Select a chart to update:"
  puts_space
  print_users
  puts_space
end


def update_menu
  puts "Which would you like to update? Type 'name' to change a user's name or 'chart' to change a user's chart"
  puts "type 'return' to return to the main menu"
  puts_space
end


def update_name
  old_name = get_old_name

  if old_name == "return"
    clear
    update
  elsif !User.all_names.include?(old_name)
    clear
    puts "That user does not exist"
    update_name
  else
    new_name = get_new_name

    if new_name == "return"
      clear
      update
    else
      User.update_name(old_name, new_name)
      puts "Name has been updated to #{new_name}."
    end
  end
end


def update_name_menu
  puts "Type in the user's name you would like to change:"
  puts_space
  print_users
  puts_space
end
