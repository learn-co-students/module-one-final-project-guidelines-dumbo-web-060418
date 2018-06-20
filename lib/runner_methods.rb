require 'date'

def add
  name = get_name
  date = get_birthday
  birthchart = get_birthchart(date)
  new_person = User.find_or_create_by(name: name)
  save_chart(birthchart, new_person)
end

def all_signs
  Sign.all.each do |sign|
  puts "--------------------------------------------------"
  puts " "
  puts "#{sign.name} #{SYMBOLS[sign.name.to_sym]} // Element - #{sign.element} // Quality - #{sign.quality} // Ruled by #{sign.ruled_by}"
  puts " "
end
end

def all_planets
  Planet.all.each do |planet|
  puts "--------------------------------------------------"
  puts " "
  puts "#{planet.name} #{SYMBOLS[planet.name.to_sym]} // #{planet.meaning} // Ruler of #{planet.ruler_of}"
  puts " "
end
end


def check_for_name(name)
  User.find_by(name: name).nil?
end


def compare
  first_user = get_user(1)
  second_user = get_user(2)
  first_chart = first_user.charts.sort_by { |chart| chart.planet_id }
  second_chart = second_user.charts.sort_by { |chart| chart.planet_id }
  puts "         #{first_user.name}     ||        #{second_user.name}"
  puts "  "
  prints_two_charts(first_chart, second_chart)
end


def delete
  puts "Who would you like to delete?"
  print_users
  name = gets.chomp

  if name == "cancel"
  elsif check_for_name(name)
    puts "Please enter a valid name or type 'cancel' to return to main menu:"
    delete
  else
    delete_user(name)
    puts "#{name} has been deleted."
  end
end


def delete_user(user_name)
  user = User.find_by(name: user_name)
  Chart.where(user_id: user.id).each { |chart| chart.destroy }
  user.destroy
end


def get_user(x)
  puts "Select chart #{x}."
  print_users
  name = gets.chomp

  if check_for_name(name)
    puts "Please enter a valid name"
    get_user(x)
  else
    User.find_by(name: name)
  end
end


def get_choice
  options
  gets.chomp
end


def get_birthchart(date)
  CLIENT.call(date[1], date[0], date[2], 12, 00, 47.115, -101.30, -6)
end


def get_birthday
  puts "Enter birthday in MM/DD/YYYY format:"
  input = gets.chomp
  date = input.split("/")
  if date.length != 3 || !Date.valid_date?(date[2].to_i,date[0].to_i,date[1].to_i)
    puts "Try again."
    date = get_birthday
  end
  date
end


def get_meaning(planet, sign)
  MEANINGS[sign.name.to_sym][planet.name.to_sym]
end


def get_name
  puts "Please enter the person's name:"
  gets.chomp
end


def options
  puts "would you like to..."
  puts "type 'add' to add chart"
  puts "type 'delete' to delete a chart"
  puts "type 'view' to view chart"
  puts "type 'view chart stats' to see stats about friends"
  puts "type 'compare' to compare charts"
  puts "type 'all signs' to learn about all the signs"
  puts "type 'all planets' to learn about all the planets"
  puts "type 'exit' to exit astroCLI"
end


def print_chart(planet, sign)
  sleep(0.25)
  puts "#{planet.meaning}:    #{SYMBOLS[planet.name.to_sym]} #{planet.name} in #{SYMBOLS[sign.name.to_sym]} #{sign.name}"
  sleep(0.25)
  puts " "
  puts get_meaning(planet, sign)
  sleep(0.25)
  puts " "
  puts "---------------------------------------------------"
  sleep(0.25)
  puts " "
end


def prints_comparisons(planet, sign1, sign2)
  puts "--------------------------------------------------"
  puts "#{planet.meaning}:    #{SYMBOLS[planet.name.to_sym]} #{planet.name} in #{SYMBOLS[sign1.name.to_sym]} #{sign1.name} || #{SYMBOLS[planet.name.to_sym]} #{planet.name} in #{SYMBOLS[sign2.name.to_sym]} #{sign2.name}"
  puts "  "

  if ASPECTS[sign1.name.to_sym][:Positive].include?(sign2.name)
    puts "#{POSITIVE[rand(POSITIVE.size)]}"
  elsif ASPECTS[sign1.name.to_sym][:Negative].include?(sign2.name)
    puts "#{NEGATIVE[rand(NEGATIVE.size)]}"
  else
    puts "#{NEUTRAL[rand(NEUTRAL.size)]}"
  end

  puts "  "
end


def prints_two_charts(first_chart, second_chart)
  i = 0

  while i < first_chart.length
    planet = Planet.find_by(id: first_chart[i].planet_id)
    sign1 = Sign.find_by(id: first_chart[i].sign_id)
    sign2 = Sign.find_by(id: second_chart[i].sign_id)
    prints_comparisons(planet, sign1, sign2)
    i += 1
  end
end

def print_users
  User.all.each do |user|
    puts user.name
  end
end

def run
  loop do
    choice = get_choice

    case choice
    when "add"
      add
      puts "User has been added."

    when "delete"
      delete

    when "view"
      if User.all.empty?
        puts "There are no charts to view."
      else
        view_a_chart
      end

    when "compare"
      if User.all.length <= 1
        puts "Add users first to compare their charts."
      else
        compare
      end

    when "view chart stats"
      view_chart_stats

    when "all signs"
      all_signs

    when "all planets"
      all_planets

    when "exit"
      puts "goodbye"
      break

    else
      puts "enter a valid command"
    end
  end
end

def save_chart(birthchart, user)
  birthchart.pop
  birthchart.each do |planethash|
    planet = Planet.find_by(name: planethash["name"])
    sign = Sign.find_by(name: planethash["sign"])
    Chart.create(user_id: user.id, planet_id: planet.id, sign_id: sign.id)
  end
end

def sun_sign_counts
  sign_count = {}
  Sign.all.each do |sign|
    sign_count[sign.name] = 0
  end

  Chart.where(planet_id: 1).each do |sun_chart|
    sign = Sign.find_by(id: sun_chart.sign_id)
    sign_count[sign.name] += 1
  end
  sign_count.select do |sign, number|
    number > 0
  end
end

def print_sun_sign_counts(sun_sign_counts)
  sun_sign_counts.each do |sign, count|
    sym = SYMBOLS[sign.to_sym]
    puts " "
    puts "#{sym} #{sign} - #{count} #{sym}"
    puts " "
    puts "---------------------------------"
  end
end


def view_a_chart
  puts "Select a name or type 'return' to go back to the menu"
  print_users
  name = gets.chomp

  if name == "return"
  elsif check_for_name(name)
    puts "That name does not exist"
    view_a_chart
  else
    view_chart_by_name(name)
  end
end

def view_chart_by_name(name)
  user = User.find_by(name: name)
  charts = user.charts.sort_by { |chart| chart.planet_id }
  charts.each do |row|
    planet = Planet.find_by(id: row.planet_id)
    sign = Sign.find_by(id: row.sign_id)
    print_chart(planet, sign)
  end
end

def view_chart_stats
  loop do
    puts "Select one of the following:"
    view_chart_stats_options
    choice = gets.chomp

    case choice
    when "sun sign counts"
      count = sun_sign_counts
      print_sun_sign_counts(count)
    when "return"
      break
    else
      puts "Please enter a valid command"
    end
  end
end

def view_chart_stats_options
  puts "type 'sun sign counts' to see how many of your friend have each sun sign"
  puts "type 'return' to return to the main menu"
end
