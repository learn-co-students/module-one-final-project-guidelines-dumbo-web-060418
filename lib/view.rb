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


def print_sun_sign_counts(sun_sign_counts)
  sun_sign_counts.each do |sign, count|
    sym = SYMBOLS[sign.to_sym]
    puts "#{sym} #{sign} - #{count} #{sym}"
    puts_space_line_space
  end
end


def random(const)
  const[rand(const.size)]
end


def sun_sign_counts
  sign_count = {}
  Sign.all.each { |sign| sign_count[sign.name] = 0 }

  Chart.where(planet_id: 1).each do |sun_chart|
    sign = Sign.find_by(id: sun_chart.sign_id)
    sign_count[sign.name] += 1
  end

  sign_count.select { |sign, number| number > 0 }
end


def view_a_chart
  clear
  puts "Select a name or type 'return' to go back to the menu"
  print_users
  name = gets.chomp.strip

  if name == "return"
    return
  elsif name_invalid?(name)
    puts "That name does not exist"
    view_a_chart
  else
    view_chart_by_name(name)
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


def view_chart_stats
  loop do
    clear
    puts "Select one of the following:"
    view_chart_stats_options
    choice = gets.chomp.strip

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
  clear
  puts "type 'sun sign counts' to see how many of your friend have each sun sign"
  puts "type 'return' to return to the main menu"
end
