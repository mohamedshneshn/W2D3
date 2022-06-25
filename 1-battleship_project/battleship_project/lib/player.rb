class Player

    def get_move # returns array of two integers
        puts "enter a position with coordinates separated with a space like `4 7`" # ask user for input
         gets.chomp.split(" ").map { |num| num.to_i } # convert input to array of integers
        
    end
end
