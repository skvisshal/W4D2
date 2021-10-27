require_relative "../board.rb"
require "byebug"

class Piece

    attr_reader :color, :board
    attr_accessor :pos
    def initialize(color, board, pos=nil)
        @color = color
        @board = board
        @pos = pos
    end

    def valid_moves
        # debugger
        # moves
        arr = moves.dup
        arr.reject {|pos| move_into_check?(pos)}
    end

    def valid_moves_for_dup
        moves
    end

    def to_s
        "#{@color} #{pos}"
    end

    def move_into_check?(end_pos)
        new_board = @board.deep_dup
        new_board.move_piece_for_dup(self.color, self.pos, end_pos)
        p new_board.in_check?(self.color)
        new_board.in_check?(self.color)
    end

    def empty?
        @board[@pos] == @board.null_piece
    end


end