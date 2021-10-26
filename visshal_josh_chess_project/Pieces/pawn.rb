require_relative "piece.rb"

class Pawn < Piece

    def symbol
        :P
    end

    def moves
        forward_steps + side_attacks
    end

    private
    def at_start_row?
        (@color == :b && @pos[0] == 1) || (@color == :w && @pos[0] == 6)
    end

    def forward_dir
        return -1 if @color == :w
        1
    end

    def forward_steps
        poss_moves = []
        x,y = @pos
        if at_start_row?
            poss_moves << [x+(2*forward_dir),y] if @board[[x+forward_dir,y]].color == nil
        end
        poss_moves << [x+forward_dir,y]
        poss_moves.select do |pos|
            @board.valid_pos?(pos) && @board[pos].color == nil
        end
    end

    def side_attacks
        poss_moves=[]
        x,y = @pos
        poss_moves << [x+forward_dir,y+forward_dir]
        poss_moves << [x+forward_dir,y-forward_dir]
        poss_moves.select do |pos|
            @board.valid_pos?(pos) && @board[pos].color == (@color==:w ? :b : :w)
        end
    end

end