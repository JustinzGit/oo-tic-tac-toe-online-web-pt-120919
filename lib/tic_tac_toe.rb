class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == " " ? false : true
  end 
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end 
  
  def turn_count
    @board.count{|index| index != " "} 
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Enter board position 1-9: "
    input = gets.strip
    position = input_to_index(input)
    
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end
  
  def won? 
    WIN_COMBINATIONS.each do |array|
      x = 0
      o = 0 
      array.each do |i|
        if @board[i] == "X"
          x += 1 
        elsif @board[i] == "O"
          o += 1
        end 
        
        if x == 3 || o == 3
          return array
        end
      end
    end
    false
  end
  
  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end 
  
  def draw?
    full? && !won?
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner
    won? ? @board[won?[0]] : nil
  end
  
  def play
    while !over?
      turn
<<<<<<< HEAD
=======
      over?
>>>>>>> 25ec56830c06f405512ee5e6911145d2e7caf3d1
    end
    
    if won?
      player = winner
      puts "Congratulations #{player}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 
end 