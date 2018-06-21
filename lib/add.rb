def add
  clear
  name = get_name
  if name == "return"
    clear
    return
  else
    create_chart
  end
end


def create_chart
  date = get_birthday

  if date == "return"
    clear
    return
  elsif date_invalid?(format_birthday(date))
    puts "Try again"
    create_chart
  else
    formatted_date = format_birthday(date)
    birthchart = get_birthchart(formatted_date)
    new_person = User.find_or_create_by(name: name)
    save_chart(birthchart, new_person)
    puts "#{name} has been added."
    continue
  end
end

def date_invalid?(date)
  date.length != 3 || !Date.valid_date?(date[2].to_i,date[0].to_i,date[1].to_i)
end


def get_birthchart(date)
  CLIENT.call(date[1], date[0], date[2], 12, 00, 47.115, -101.30, -6)
end

def get_birthday
  puts_space
  puts "Enter birthday in MM/DD/YYYY format:"
  puts_space
  birthday = gets.chomp.strip
  puts_space
  birthday
end

def format_birthday(birthday)
  birthday.split("/")
end


def get_name
  puts_space
  puts "Please enter the person's name:"
  puts_space
  gets.chomp.strip
end


def save_chart(birthchart, user)
  birthchart.pop

  birthchart.each do |planethash|
    planet = Planet.find_by(name: planethash["name"])
    sign = Sign.find_by(name: planethash["sign"])
    Chart.create(user_id: user.id, planet_id: planet.id, sign_id: sign.id)
  end
end
