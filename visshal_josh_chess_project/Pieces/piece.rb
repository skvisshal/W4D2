class Piece

    attr_reader :color, :board, :pos
    def initialize(color, board, pos=nil)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        "#{@color} #{pos}"
    end

    def empty?
        @board[@pos] == @board.null_piece
    end


end