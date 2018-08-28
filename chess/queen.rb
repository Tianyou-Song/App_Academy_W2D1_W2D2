require_relative 'piece.rb'
require_relative 'board.rb'

class Queen < Piece
  include SlidingPiece
  
  def symbol
    :Q
  end 
  
  protected
  
  def move_dirs 
    DIAGONAL_DIRS + HORIZONTAL_DIRS
  end
  
end 