require_relative "piece.rb"
# require_relative "../board.rb"
require "./Pieces/modules/stepable.rb"

class King < Piece
include STEPABLE

    def symbol
        :K
    end

    # def valid_moves
    #     arr = moves
    #     arr.reject {|pos| move_into_check?(pos)}
    # end

    def move_diffs
        # debugger
        x,y = @pos
        valid_pos = []
        (x-1..x+1).each do |i|
            (y-1..y+1).each do |j|
                valid_pos << [i,j] if !(x==i && y==j)
            end
        end
        valid_pos.select do |pos|
            @board.valid_pos?(pos) && (@board[pos].color == @color || @board[pos].color == nil)
        end
    end
end

