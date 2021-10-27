require_relative "./Pieces/rook.rb"
require_relative "./Pieces/queen.rb"
require_relative "./Pieces/bishop.rb"
require_relative "./Pieces/knight.rb"
require_relative "./Pieces/king.rb"
require_relative "./Pieces/pawn.rb"
require_relative "./Pieces/nullpiece.rb"
require_relative "./Pieces/piece.rb"
require "colorize"

class Board
    attr_reader :rows, :null_piece
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece.instance
        self.populate
    end

    def populate
    
        (0...@rows.length).each do |i|
            (0...@rows[i].length).each do |j|
                if i == 0
                    @rows[i][j] = Rook.new(:b, self, [i,j]) if j == 0 || j == 7
                    @rows[i][j] = Knight.new(:b, self, [i,j]) if j == 1 || j == 6
                    @rows[i][j] = Bishop.new(:b, self, [i,j]) if j == 2 || j == 5
                    @rows[i][j] = Queen.new(:b, self, [i,j]) if j == 3
                    @rows[i][j] = King.new(:b, self, [i,j]) if j == 4
                elsif i == 7
                    @rows[i][j] = Rook.new(:w, self, [i,j]) if j == 0 || j == 7
                    @rows[i][j] = Knight.new(:w, self, [i,j]) if j == 1 || j == 6
                    @rows[i][j] = Bishop.new(:w, self, [i,j]) if j == 2 || j == 5
                    @rows[i][j] = Queen.new(:w, self, [i,j]) if j == 3
                    @rows[i][j] = King.new(:w, self, [i,j]) if j == 4
                elsif i == 1
                    @rows[i][j] = Pawn.new(:b, self, [i,j])
                elsif i == 6
                    @rows[i][j] = Pawn.new(:w, self, [i,j])
                else
                    @rows[i][j] = @null_piece
                end
            end
        end
    end

    def [](pos)
        x,y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x,y = pos
        @rows[x][y] = val
    end

    def length
        @grid.length
    end

    def move_piece(color, start_pos, end_pos)
        raise "Empty start Position" if self[start_pos] == @null_piece || self[start_pos].color != color
        raise "Illegal Move" if !self[start_pos].valid_moves.include?(end_pos) || self[end_pos].color == color 

        self.add_piece(self[start_pos], end_pos)
        self.add_piece(@null_piece, start_pos)
    end

    def add_piece(piece, pos)
        if valid_pos?(pos)
            self[pos] = piece
        end
    end

    def valid_pos?(pos)
        x, y = pos
        x.between?(0,7) && y.between?(0,7)
    end

    def print_board(cursor_pos)
        @rows.each do |row|
            row.each do |piece|
                if piece.pos == cursor_pos
                    print "#{piece.symbol} ".colorize(:red)
                else
                    print "#{piece.symbol} "
                end
            end
            print "\n"
        end
    end
end

b = Board.new
# b.print_board
#b.move_piece(:b, [1,0], [2,0])
# p b[[0,2]].moves