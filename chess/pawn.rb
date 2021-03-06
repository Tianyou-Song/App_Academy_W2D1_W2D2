require_relative 'piece.rb'
require_relative 'board.rb'
require 'byebug'

class Pawn < Piece
  
  def symbol
    if @color == :white
      ♙
    else
      ♟
    end
  end 
  
  def move_dirs
    forward_steps + side_attacks.select { |pos| @board[pos].color == (self.color == :white ? :black : :white) }
  end 
  
  private 
  
  def at_start_row?
    if @color == :white
      self.pos[0] == 6
    else
      self.pos[0] == 1
    end 
  end 
  
  def forward_dir
    if @color == :white
      1
    else
      -1
    end 
  end 
  
  def forward_steps
    steps = [[self.pos[0] + forward_dir, self.pos[1]]]
    if at_start_row?
      steps << [self.pos[0] + forward_dir * 2, self.pos[1]]
    end
    steps
  end 
  
  def side_attacks
    [[self.pos[0] + forward_dir, self.pos[1] + 1], [self.pos[0] + forward_dir, self.pos[1] - 1]]
  end
  
end 
# 
# if __FILE__ == $PROGRAM_NAME 
#   board = Board.new
#   piece = Pawn.new(:white, [4, 4], board)
#   p piece.move_dirs
# end 