require_relative "piece.rb"
require "./Pieces/modules/slideable.rb"

class Queen < Piece
    include SLIDEABLE

    def symbol
        :Q
    end

    # def valid_moves
    #     arr = moves
    #     arr.reject {|pos| move_into_check?(pos)}
    # end

    private

    def move_dirs
        horizontal_dirs 
        diagonal_dirs
    end
end


