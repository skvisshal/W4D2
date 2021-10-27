require_relative "piece.rb"
require "singleton"

class NullPiece < Piece
    include Singleton
    def initialize 
    end

    
    # def valid_moves
    #     arr = moves
    #     arr.reject {|pos| move_into_check?(pos)}
    # end

    def moves
        []
    end

    def symbol
        :-
    end
end