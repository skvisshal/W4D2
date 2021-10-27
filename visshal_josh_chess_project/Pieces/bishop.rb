require_relative "piece.rb"
require "./Pieces/modules/slideable.rb"

class Bishop < Piece
    include SLIDEABLE


    def symbol
        :B
    end

    # def valid_moves
    #     arr = moves
    #     arr.reject {|pos| move_into_check?(pos)}
    # end

    private

    def move_dirs
        diagonal_dirs
    end

end