class Sudoku

  @@sudokus_solved = 0
  @@sudokus_unsolvable = 0
  
  def initialize(board_string)
    board_array = board_string.split("").map{|x| x.to_i}
    @board_state = Array.new(9){ board_array.shift(9) }
    @cell = [8,8]
    @solvable_flag = 0
  end
 
  def solve!
    
    while game_not_finished?
      if solvable? 
        move_to_next_cell
        if cell_empty? && remaining_possibilities.length == 1
          #sleep(0.05)
          set_cell!(remaining_possibilities[0])
          puts 
          board
        end
      else
        puts "Sudoku unsolvable"
        @@sudokus_unsolvable +=1
        return
      end
    end
    puts "Sudoku solved."
    @@sudokus_solved +=1  
  end
 
  def game_not_finished?
    temp = @board_state.flatten
    if temp.include?(0) 
      return true
    end
    false
  end  
 
 
  def move_to_next_cell
    if @cell[0] == 8 && @cell[1] == 8
      move_back_to_start
    elsif @cell[1] == 8
      move_to_next_row
    else
      move_to_next_column 
    end    
  end
 
  def move_to_next_column
    @cell[1] += 1
  end
 
  def move_to_next_row
    @cell[0] += 1
    @cell[1] = 0
  end
 
  def move_back_to_start 
    @cell[0] = 0
    @cell[1] = 0
    @solvable_flag += 1
  end
 
 
  # cell will be a two integer array [row #, column, #]
  def cell_empty?
    row_num = @cell[0]
    col_num = @cell[1]
    return @board_state[row_num][col_num] == 0 
  end
 
  def set_cell!(new_contents)
    row_num = @cell[0]
    col_num = @cell[1]
    @board_state[row_num][col_num] = new_contents
    @solvable_flag = 0 
  end
 
  def remaining_possibilities
    
    initial_possibilities = (1..9).to_a
    
    all_impossibilities = all_numbers_in_row + 
                          all_numbers_in_column +
                          all_numbers_in_box
 
    all_impossibilities.uniq!
 
    remaining_possibilities = initial_possibilities - all_impossibilities
    return remaining_possibilities
  end
 
  def all_numbers_in_row
    row_num = @cell[0]
    col_num = @cell[1]
    numbers_found = []
    
    0.upto(8) do |var|
      cell_contents = @board_state[row_num][var]
      numbers_found << cell_contents if cell_contents > 0
    end
 
    return numbers_found
  end
 
  def all_numbers_in_column
    row_num = @cell[0]
    col_num = @cell[1]
    numbers_found = []
    
    0.upto(8) do |var|
      cell_contents = @board_state[var][col_num]
      numbers_found << cell_contents if cell_contents > 0
    end
 
    return numbers_found
  end
 
  def all_numbers_in_box
    row_num = @cell[0]
    col_num = @cell[1]
    numbers_found = []
    rows_to_include = which_third(row_num)
    columns_to_include = which_third(col_num)
    
    rows_to_include.each do |i|
      columns_to_include.each do |j|
        cell_contents = @board_state[i][j]
        numbers_found << cell_contents if cell_contents > 0
      end
    end
 
    return numbers_found
 
  end
  
  def which_third(n)
    if n < 3 
      return [0,1,2]
    elsif n < 6
      return [3,4,5]
    elsif n < 9
      return [6,7,8]
    end
  end  
 
 
  # Returns a string representing the current state of the board
  # Don't spend too much time on this method; flag someone from staff
  # if you are.
  def board
    output = ""
    counter = 0
    @board_state.each do |row|
        output << "-" * 21 + "\n" if counter % 3 == 0    
        output << row[0..2].join(" ") + " | "
        output << row[3..5].join(" ") + " | "
        output << row[6..8].join(" ") + "\n"
        counter +=1
    end
    puts output.gsub(/0/," ")
  end

  def solvable?
    @solvable_flag <= 1
  end

  def self.get_solved
    @@sudokus_solved
  end

  def self.get_unsolvable
    @@sudokus_unsolvable
  end

end
 
# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
# board_string = File.readlines('sample.unsolved.txt').first.chomp
 
# game = Sudoku.new(board_string)
 
# # Remember: this will just fill out what it can and not "guess"
# game.solve!
 
# puts game.board

def grab_all_boards_from_file(file_name)
 
  source = File.new(file_name)
 
  boards = []
 
  source.each_line do |line|
    boards << line
  end
  
  source.close
  boards
end

boards = grab_all_boards_from_file("sample.unsolved.txt")

boards.each do |board|
  game = Sudoku.new(board)
  game.solve!
end

puts 
puts
puts "Sudokus solved: #{Sudoku.get_solved}"
puts "Sudokus unsolved: #{Sudoku.get_unsolvable}" 