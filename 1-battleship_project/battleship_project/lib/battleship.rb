require_relative "board"
require_relative "player"

class Battleship
     attr_reader :board, :player, :remaining_misses
     
   def initialize (n)

    @player= Player.new
    @board= Board.new(n)            #
    @remaining_misses= @board.size/2 # half the size of the board
    # @remaining_misses= (n*n)/2 # half the size of the board
   end
end
