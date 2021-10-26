require_relative "piece.rb"
require "./Pieces/modules/stepable.rb"

class Knight < Piece
include STEPABLE
    def symbol
        :N
    end

    def move_diffs
        x,y = @pos
        valid_pos = []
        new_array = Array.new
        x, y = pos
        new_array << [x + 2, y + 1]
        new_array << [x + 2, y - 1]
        new_array << [x + 1, y + 2]
        new_array << [x + 1, y - 2]
        new_array << [x - 1, y - 2]
        new_array << [x - 1, y + 2]
        new_array << [x - 2, y + 1]
        new_array << [x - 2, y - 1]
        new_array.select! do |pos|
            @board.valid_pos?(pos) && @board[pos].color != @color
        end
        valid_pos += new_array
    end
end