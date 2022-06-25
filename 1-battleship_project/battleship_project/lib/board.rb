class Board
    attr_reader :size                       # getter method for @size
    def self.print_grid(grid)               # class method for printing @grid
        grid.each do |row|
            puts row.join(" ")
        end
    end
    # --------------------------------------------------------

  def initialize(n)                           # n=2 is the size of the board
    @grid = Array.new(n) { Array.new(n, :N) } #[[:N, :N], [:N, :N]]
    @size = n * n                             # 2*2=4 (2 rows, 2 columns) size of the board
  end

#   ----------------------------------------------------------
    def [](pos)        #getter method returns the element of the board at the given position
# @grid [pos[0]][pos[1]]
        row, col = pos
        @grid[row][col]
end
#   ----------------------------------------------------------
def []=(pos,value)      #setter method sets the element of the board at the given position

    row, col = pos
    @grid[row][col] = value
end
# --------------------------------------------------------------
def num_ships                               # returns the number of ships on the board
    @grid.flatten.count { |ele| ele == :S }
end
# --------------------------------------------------------------
def attack(pos)                             # accepts a position as an arg and returns a symbol representing the result of the attack
    # row, col = pos
    # if @grid[row][col] == :S
    #     @grid[row][col] = :H
    #     puts "You sunk my battleship!"
    #     return true
    # else
    #     @grid[row][col] = :X
    #     return false
    # end
    if self[pos] == :S              # if the element at the given position is a ship   
        self[pos] = :H              # set that element to :H
        puts "You sunk my battleship!"
        return true
    else
        self[pos] = :X              # set that element to :X
        return false
    end

end
# --------------------------------------------------------------
def place_random_ships                  # randomly places ships on the board siize=100 
    myShips = @size*0.25                # number of ships to place=25 = :S
    while myShips > self.num_ships
        row = rand(0...@grid.length)                # random row
        col = rand(0...@grid.length)                  # random column
        self[[row, col]] = :S           # set the element at the given position to :S
      
    end
end
# --------------------------------------------------------------
def hidden_ships_grid                   # returns a copy of the board with all ships hidden
   
    @grid.map do |row|
        row.map do |ele|
            if ele == :S
                :N
            else
                ele
            end
        end
    end
end

# --------------------------------------------------------------
def cheat
    Board.print_grid(@grid)
end
def print
    Board.print_grid(self.hidden_ships_grid)
end
# ---------------------------------------------------------------------

end