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

    def move_into_check?(end_pos)
        king_pos = []
        (0...@board.length).each do |i|
            (0...@board.length).each do |j|
                king_pos = [i, j] if @board[[i,j]].is_a?(King) && @board[[i,j]] != self.color
            end
        end

    end

    def empty?
        @board[@pos] == @board.null_piece
    end


end