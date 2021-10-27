require_relative "./Pieces/piece.rb"
require_relative "./Pieces/rook.rb"
require_relative "./Pieces/queen.rb"
require_relative "./Pieces/bishop.rb"
require_relative "./Pieces/knight.rb"
require_relative "./Pieces/king.rb"
require_relative "./Pieces/pawn.rb"
require_relative "./Pieces/nullpiece.rb"
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
                    @rows[i][j] = Rook.new(:black, self, [i,j]) if j == 0 || j == 7
                    @rows[i][j] = Knight.new(:black, self, [i,j]) if j == 1 || j == 6
                    @rows[i][j] = Bishop.new(:black, self, [i,j]) if j == 2 || j == 5
                    @rows[i][j] = Queen.new(:black, self, [i,j]) if j == 3
                    @rows[i][j] = King.new(:black, self, [i,j]) if j == 4
                elsif i == 7
                    @rows[i][j] = Rook.new(:white, self, [i,j]) if j == 0 || j == 7
                    @rows[i][j] = Knight.new(:white, self, [i,j]) if j == 1 || j == 6
                    @rows[i][j] = Bishop.new(:white, self, [i,j]) if j == 2 || j == 5
                    @rows[i][j] = Queen.new(:white, self, [i,j]) if j == 3
                    @rows[i][j] = King.new(:white, self, [i,j]) if j == 4
                elsif i == 1
                    @rows[i][j] = Pawn.new(:black, self, [i,j])
                elsif i == 6
                    @rows[i][j] = Pawn.new(:white, self, [i,j])
                else
                    @rows[i][j] = @null_piece
                end
            end
        end
    end

    def in_check?(color)
        king_pos = []
        (0...@rows.length).each do |i|
            (0...@rows.length).each do |j|
                king_pos = [i, j] if self[[i,j]].is_a?(King) && self[[i,j]].color == color
            end
        end
        (0...@rows.length).each do |i|
            (0...@rows.length).each do |j|
                return true if self[[i,j]].valid_moves_for_dup.include?(king_pos)
            end
        end
        false
    end

    def in_check_mate?(color)
        return false unless in_check?(color) 
        (0...@rows.length).each do |i|
            (0...@rows.length).each do |j|
                return false if self[[i,j]].color == color && !self[[i,j]].valid_moves.empty?
            end
        end
        true
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
        @rows.length
    end

    def move_piece(color, start_pos, end_pos)
        raise "Incorrect start Position" if self[start_pos] == @null_piece || self[start_pos].color != color
        raise "Illegal Move" if !self[start_pos].valid_moves.include?(end_pos) || self[end_pos].color == color 
        self.add_piece(self[start_pos], end_pos)
        self.add_piece(@null_piece, start_pos)
    end

    def move_piece_for_dup(color, start_pos, end_pos)
        self.add_piece(self[start_pos], end_pos)
        self.add_piece(@null_piece, start_pos)
    end
        

    def add_piece(piece, pos)
        if valid_pos?(pos)
            self[pos] = piece
            self[pos].pos = pos
        end
    end

    def valid_pos?(pos)
        x, y = pos
        x.between?(0,7) && y.between?(0,7)
    end

    def print_board(cursor_pos)
        @rows.each.with_index do |row, i|
            row.each.with_index do |piece, x|
                if [i, x] == cursor_pos
                    print "#{piece.symbol} ".colorize(:red)
                else
                    print "#{piece.symbol} ".colorize(piece.color)
                end
            end
            print "\n"
        end
    end

    
    def deep_dup
        board_copy = Board.new
        @rows.each.with_index do |row, i|
            row.each.with_index do |piece, j|
                if piece == @null_piece
                    board_copy[[i,j]] = board_copy.null_piece
                else
                    board_copy[[i, j]] = piece.class.new(piece.color, board_copy, piece.pos) 
                end
            end
        end
        return board_copy
    end
end

b = Board.new
# b.print_board
#b.move_piece(:b, [1,0], [2,0])
# p b[[0,2]].moves

