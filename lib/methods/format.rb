def clear
  puts `clear`
end


def create_table(headings, rows)
  Terminal::Table.new :headings => headings, :rows => rows, :style => {:width => 150, :all_separators => true, :padding_left => 5, :border_x => "=", :border_i => "x"}
end


def indent
  print " " * 21
end

def puts_line
  puts "-" * 110
end


def puts_line_space
  puts_line
  puts_space
end


def puts_space
  puts " "
end


def puts_space_line
  puts_space
  puts_line
end


def puts_space_line_space
  puts_space
  puts_line
  puts_space
end
