def delete_user(name)
  user = User.find_by(name: name)
  user.delete_chart
  user.destroy
end

def delete
  clear
  puts "Who would you like to delete?"
  puts_space
  print_users
  puts_space
  name = gets.chomp.strip
  puts_space

  if name == "return"
    return
  elsif name_invalid?(name)
    puts "Please enter a valid name:"
    delete
  else
    delete_user(name)
    puts "#{name} has been deleted."
  end
  continue
end
