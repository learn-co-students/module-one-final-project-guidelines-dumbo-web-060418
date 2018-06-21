def continue
  puts_space
  puts "Press 'enter' to continue"
  gets.chomp
end

def name_invalid?(name)
  User.find_by(name: name).nil?
end


def get_choice
  options
  gets.chomp.strip
end


def options
  puts_space
  puts "would you like to..."
  puts_space
  puts "type 'add' to add chart"
  puts "type 'delete' to delete a chart"
  puts "type 'view' to view chart"
  puts "type 'sign counts' to see stats about friends' signs"
  puts "type 'compare' to compare charts"
  puts "type 'update' to update a chart"
  puts "type 'all signs' to learn about all the signs"
  puts "type 'all planets' to learn about all the planets"
  puts_space
  puts "type 'return' at any time to return to the previous menu"
  puts "type 'exit' to exit astroCLI"
  puts_space
end


def run
  loop do
    clear
    puts ASTROCLI
    puts_space
    choice = get_choice

    case choice
    when "add"
      add

    when "delete"
      delete
      continue

    when "view"
      clear
      if User.all.empty?
        puts "There are no charts to view."
        continue
      else
        view_a_chart
      end

    when "compare"
      clear
      if User.all.length <= 1
        puts "Add users first to compare their charts."
        continue
      else
        compare
        continue
      end

    when "update"
      clear
      update
    when "sign counts"
      sign_counts_menu

    when "all signs"
      clear
      all_signs
      continue

    when "all planets"
      clear
      all_planets
      continue

    when "exit"
      puts "goodbye"
      break

    else
      puts "enter a valid command"
    end
  end
end
