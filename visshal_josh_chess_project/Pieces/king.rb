require_relative "piece.rb"
require "./Pieces/modules/stepable.rb"

class King < Piece
include STEPABLE

    def symbol
        :K
    end

    def move_diffs
        x,y = @pos
        valid_pos = []
        (x-1..x+1).each do |i|
            (y-1..y+1).each do |j|
                valid_pos << [i,j] if !(x==i && y==j)
            end
        end
        valid_pos.select! do |pos|
            @board.valid_pos?(pos) && @board[pos].color != @color
        end
    end
end