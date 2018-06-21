def all_planets
  rows = []
  Planet.all.each do |planet|
    rows << ["#{planet.name} #{planet.symbol}", planet.meaning, planet.ruler_of]
  end
    table = Terminal::Table.new :headings => ["Planet", "Meaning", "Rules"], :rows => rows, :style => {:width => 150, :all_separators => true, :padding_left => 5, :border_x => "=", :border_i => "x"}
    puts table
end


def all_signs
  rows = []
  Sign.all.each do |sign|
    rows << ["#{sign.name} #{sign.symbol}", sign.element, sign.quality, sign.ruled_by]
  end
  table = Terminal::Table.new :headings => ["Sign", "Element", "Quality", "Ruled by"], :rows => rows, :style => {:width => 80, :all_separators => true, :padding_left => 5, :border_x => "=", :border_i => "x"}
  puts table
end


def get_meaning(planet, sign)
  MEANINGS[sign.name.to_sym][planet.name.to_sym]
end


def print_chart(planet, sign)
  puts_space
  space = 40 - planet.meaning.length
  puts "#{planet.meaning}:" + (" " * space) + "#{planet.symbol} #{planet.name} in #{sign.symbol} #{sign.name}"
  puts_space
  puts get_meaning(planet, sign)
  puts puts_space_line
end


def print_users
  User.all.each do |user|
    puts user.name
  end
end


def random(const)
  const[rand(const.size)]
end


def view_a_chart
  puts "Select a name or type 'return' to go back to the menu"
  puts_space
  print_users
  puts_space
  name = gets.chomp.strip

  if name == "return"
    return
  elsif name_invalid?(name)
    puts "That name does not exist"
    view_a_chart
  else
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
