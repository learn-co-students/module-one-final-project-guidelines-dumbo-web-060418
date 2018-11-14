def compare
  name1 = get_first_user_name

  if name1 == "return"
    clear
    return
  elsif !User.all_names.include?(name1)
    clear
    puts "Please enter a valid name"
    puts_space
    compare
  else
    name2 = get_second_user_name

    if name2 == "return"
      clear
      return
    elsif !User.all_names.include?(name2)
      clear
      puts "Please enter two valid names"
      puts_space
      compare
    else
      compare_charts(name1, name2)
      continue
    end
  end
end


def compare_charts(name1, name2)
  first_chart = User.find_by(name: name1).sorted_chart
  second_chart = User.find_by(name: name2).sorted_chart
  clear

  print_comparison_headers(name1, name2)
  print_comparison(first_chart, second_chart)
end


def create_row(planet, sign1, sign2)
  meaning = planet.meaning
  placement1 = "#{planet.symbol} #{planet.name} in #{sign1.symbol} #{sign1.name}"
  placement2 = "#{planet.symbol} #{planet.name} in #{sign2.symbol} #{sign2.name}"

  if ASPECTS[sign1.name.to_sym][:Positive].include?(sign2.name)
    combo = random(POSITIVE)
  elsif ASPECTS[sign1.name.to_sym][:Negative].include?(sign2.name)
    combo = random(NEGATIVE)
  else
    combo = random(NEUTRAL)
  end
 return [meaning, placement1, placement2, combo]
end


def get_first_user_name
  puts "Select first user"
  puts_space
  print_users
  puts_space
  name = gets.chomp.strip
  puts_space
  name
end


def get_second_user_name
  puts "Select second user"
  puts_space
  name = gets.chomp.strip
  puts_space
  name
end


def get_table_rows(first_chart, second_chart)
  i = 0
  rows = []
  while i < first_chart.length
    planet = Planet.find_by(id: first_chart[i].planet_id)
    sign1 = Sign.find_by(id: first_chart[i].sign_id)
    sign2 = Sign.find_by(id: second_chart[i].sign_id)
    rows << create_row(planet, sign1, sign2)
    i += 1
  end
  rows
end


def print_comparison(first_chart, second_chart)
  rows = get_table_rows(first_chart, second_chart)
  table = Terminal::Table.new :rows => rows, :style => {:width => 200, :all_separators => true, :padding_left => 5, :border_x => "=", :border_i => "x"}
  table.to_s.print_stupid_fast
end


def print_comparison_headers(name1, name2)
  row = [["#{name1}  |  #{name2}"]]
  padding = 100 - (name1.length + 4)
  table = Terminal::Table.new :rows => row, :style => {:width => 200, :all_separators => true, :padding_left => padding, :border_x => "=", :border_i => "x"}
  table.to_s.print_ludicrous_speed
end
