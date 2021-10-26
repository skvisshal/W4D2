require_relative "piece.rb"
require "./Pieces/modules/slideable.rb"

class Bishop < Piece
    include SLIDEABLE


    def symbol
        :Bishop
    end

    private

    def move_dirs
        diagonal_dirs
    end

end