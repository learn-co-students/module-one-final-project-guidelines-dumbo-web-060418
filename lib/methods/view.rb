def all_planets
  rows = []
  Planet.all.each do |planet|
    rows << ["#{planet.name} #{planet.symbol}", planet.meaning, planet.ruler_of]
  end

  table = create_table(["Planet", "Meaning", "Rules"], rows)
  table.to_s.print_ludicrous_speed
end


def all_signs
  rows = []

  Sign.all.each do |sign|
    rows << ["#{sign.name} #{sign.symbol}", sign.element, sign.quality, sign.ruled_by]
  end

  table = create_table(["Sign", "Element", "Quality", "Ruled by"], rows)
  table.to_s.print_ludicrous_speed
end


def get_meaning(planet, sign)
  MEANINGS[sign.name.to_sym][planet.name.to_sym]
end


def print_chart(planet, sign)
  puts_space
  space = 40 - planet.meaning.length
  indent
  puts "#{planet.meaning}:" + (" " * space) + "#{planet.symbol} #{planet.name} in #{sign.symbol} #{sign.name}"
  puts_space
  indent
  puts get_meaning(planet, sign)
  indent
  puts_space
  indent
  puts_line
  sleep(0.3)
end


def print_users
  User.all.each do |user|
    puts user.name
  end
end


def random(const)
  const[rand(const.size)]
end


def view
  puts "Select a name or type 'return' to go back to the menu"
  puts_space
  print_users
  puts_space
  name = gets.chomp.strip
  puts_space

  if name == "return"
    return
  elsif name_invalid?(name)
    puts "That name does not exist"
    view
  else
    clear
    SIGN_ART.print_ludicrous_speed
    puts_space
    indent
    puts name.upcase
    view_chart_by_name(name)
    continue
  end
end


def view_chart_by_name(name)
  user = User.find_by(name: name)
  charts = user.sorted_chart

  charts.each do |row|
    planet = Planet.find_by(id: row.planet_id)
    sign = Sign.find_by(id: row.sign_id)
    print_chart(planet, sign)
  end
end
