def add
  name = get_name
  new_person = User.create(name: name)
  date = get_birthday
  time = get_birthtime
  place = get_birthplace
  birthchart = get_birthchart(date, time, place)
  save_chart(birthchart, new_person)
end

def birth_coordinates(city)
  Geocoder.coordinates(city)
end

def check_for_name(name)
  User.find_by(name: name).nil?
end

def get_choice
  options
  gets.chomp
end

def format_birthday(bd)
  bd.split("/")
end

def format_birthtime(time)
  time.split(":")
end

def get_birthchart(date, time, place)
  f_date = format_birthday(date)
  f_time = format_birthtime(time)
  f_place = birth_coordinates(place)
  timezone = get_timezone(f_place[1])

  CLIENT.call(f_date[1], f_date[0], f_date[2], f_time[0], f_time[1], f_place[0], f_place[1], timezone)
end

def get_birthday
  puts "Enter birthday in MM/DD/YYYY format:"
  gets.chomp
end

def get_birthplace
  puts "Enter birth city and state:"
  gets.chomp
end

def get_birthtime
  puts "Enter birth time in HH:MM (24 hour format). If you don't know, take a guess!"
  gets.chomp
end

def get_name
  puts "Please enter the person's name:"
  gets.chomp
end

def get_timezone(lon)
  t = lon / 15
  return t.positive? ? t.floor : t.ceil
end

def options
  puts "would you like to..."
  puts "type 'add' to add chart"
  puts "type 'view' to view chart"
  puts "type 'compare' to compare charts"
  puts "type 'exit' to exit astroCLI"
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

    when "view"
      view

    when "compare"

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

def select_chart(name)
  user = User.find_by(name: name)
  user.charts.each do |row|
    planet = Planet.find_by(id: row.planet_id)
    sign = Sign.find_by(id: row.sign_id)
    puts "#{planet.name} in #{sign.name}"
  end
end

def view
  print_users
  puts "Select a name"
  name = gets.chomp

  if check_for_name(name)
    puts "That name does not exist"
    view
  else
    select_chart(name)
  end
end
