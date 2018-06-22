def count_signs_for(planet_id)
  sign_count = {}
  Sign.all.each { |sign| sign_count[sign.name] = 0 }

  Chart.where(planet_id: planet_id).each do |chart|
    sign = Sign.find_by(id: chart.sign_id)
    sign_count[sign.name] += 1
  end

  sign_count.select { |sign, number| number > 0 }
end


def print_sign_counts(sign_counts)
  rows = []
  sign_counts.each do |sign, count|
    sym = SYMBOLS[sign.to_sym]
    rows << ["#{sym} #{sign} #{sym}", count]
  end
  table = Terminal::Table.new rows: rows, :style => {:width => 75, :all_separators => true, :padding_left => 5, :border_x => "=", :border_i => "x"}
  table.to_s.print_ludicrous_speed
end


def sign_counts(planet_id)
  counts = count_signs_for(planet_id)
  print_sign_counts(counts)
end


def sign_counts_menu
  loop do
    clear
    puts "Select one of the following:"
    stat_options
    choice = gets.chomp.strip

    case choice
    when "sun"
      clear
      puts SUN_ART
      sign_counts(1)
      continue
    when "moon"
      clear
      puts MOON_COUNTS_ART
      sign_counts(2)
      continue
    when "mercury"
      clear
      puts MERCURY_ART
      sign_counts(3)
      continue
    when "venus"
      clear
      puts VENUS_ART
      sign_counts(4)
      continue
    when "mars"
      clear
      puts MARS_ART
      sign_counts(5)
      continue
    when "jupiter"
      clear
      puts JUPITER_ART
      sign_counts(6)
      continue
    when "saturn"
      clear
      puts SATURN_ART
      sign_counts(7)
      continue
    when "uranus"
      clear
      puts URANUS_ART
      sign_counts(8)
      continue
    when "neptune"
      clear
      puts NEPTUNE_ART
      sign_counts(9)
      continue
    when "pluto"
      clear
      puts PLUTO_ART
      sign_counts(10)
      continue
    when "return"
      break
    else
      puts "Please enter a valid command"
    end
  end
end


def stat_options
  clear
  puts "type 'sun' to see how many of your friends have each sun sign"
  puts "type 'moon' to see how many of your friends have each moon sign"
  puts "type 'mercury' to see how many of your friends have each mercury sign"
  puts "type 'venus' to see how many of your friends have each venus sign"
  puts "type 'mars' to see how many of your friends have each mars sign"
  puts "type 'jupiter' to see how many of your friends have each jupiter sign"
  puts "type 'saturn' to see how many of your friends have each saturn sign"
  puts "type 'uranus' to see how many of your friends have each uranus sign"
  puts "type 'neptune' to see how many of your friends have each neptune sign"
  puts "type 'pluto' to see how many of your friends have each pluto sign"
  puts_space
  puts "type 'return' to return to the main menu"
  puts_space
end
