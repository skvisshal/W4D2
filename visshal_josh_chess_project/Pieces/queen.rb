require_relative "piece.rb"
require "./Pieces/modules/slideable.rb"

class Queen < Piece
    include SLIDEABLE

    def symbol
        :Q
    end

    private

    def move_dirs
        horizontal_dirs 
        diagonal_dirs
    end

end