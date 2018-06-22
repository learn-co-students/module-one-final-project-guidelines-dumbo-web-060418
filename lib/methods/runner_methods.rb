def astro_glide
  ASTROCLIS.each do |logo|
    clear
    puts logo
    puts MOON_ART
    sleep(0.02)
  end
end


def continue
  puts_space
  puts "Press 'enter' to continue"
  gets.chomp
end


def get_choice
  gets.chomp.strip
end


def goodbye
  clear
  GOODBYE.print_stupid_fast
end


def intro
  clear
  ASTROCLI_CENTER.print_ludicrous_speed
  MOON_ART.print_ludicrous_speed
  sleep(1)
  astro_glide
  clear

  puts ASTROCLI
  puts_space
  "would you like to...".print_slowly
  sleep(0.5)
  puts_space
  puts "type 'add' to add chart"
  sleep(0.3)
  puts "type 'delete' to delete a chart"
  sleep(0.3)
  puts "type 'view' to view chart"
  sleep(0.3)
  puts "type 'sign counts' to see stats about friends' signs"
  sleep(0.3)
  puts "type 'compare' to compare charts"
  sleep(0.3)
  puts "type 'update' to update a chart"
  sleep(0.3)
  puts "type 'all signs' to learn about all the signs"
  sleep(0.3)
  puts "type 'all planets' to learn about all the planets"
  sleep(0.3)
  puts_space
  puts "type 'return' at any time to return to the previous menu"
  sleep(0.3)
  puts "type 'exit' to exit astroCLI"
  puts_space
  clear
end


def name_invalid?(name)
  User.find_by(name: name).nil?
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
  intro
  loop do
    clear
    puts ASTROCLI
    options
    choice = get_choice

    case choice
    when "add"
      add
    when "delete"
      delete
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
      end

    when "update"
      clear
      update
    when "sign counts"
      sign_counts_menu
    when "all signs"
      clear
      SIGN_ART.print_ludicrous_speed
      all_signs
      continue
    when "all planets"
      clear
      PLANETS.print_ludicrous_speed
      all_planets
      continue
    when "exit"
      break
    else
      puts_space
      puts "enter a valid command"
      continue
    end
  end
  goodbye
end
