class String
  
  def print_slowly
    self.each_char do |c|
      sleep 0.05
      print c
    end
    puts " "
  end

  def print_fast
    self.each_char do |c|
      sleep 0.005
      print c
    end
  end

  def print_ludicrous_speed
    self.each_char do |c|
      sleep 0.001
      print c
    end
  end

  def print_stupid_fast
    self.each_char do |c|
      sleep 0.0001
      print c
    end
  end

end
