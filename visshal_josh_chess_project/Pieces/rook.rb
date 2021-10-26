require_relative "piece.rb"
require "./Pieces/modules/slideable.rb"

class Rook < Piece
    include SLIDEABLE

    def symbol
        :Rook
    end

    private

    def move_dirs
        horizontal_dirs
    end

end