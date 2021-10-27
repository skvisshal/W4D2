require_relative "required_files.rb"

class Game

    def initialize 
        @board = Board.new
        @display = Display.new(@board)
        @players = Hash.new
        @players[1] = HumanPlayer.new(:white, @display)
        @players[2] = HumanPlayer.new(:black, @display)
        @current_player = @players[1]
    end

    def play
        checkmate = false
        until checkmate
            pos1, pos2 = @current_player.make_move(@board)
            @board.move_piece(@current_player.color, pos1, pos2)
            if @board.in_check_mate?(@current_player.color, )
                check_mate = true
            end
            swap_turn!
        end
    end

    def notify_players


    end

    def swap_turn!
        @current_player == @players[1] ? @current_player = @players[2] : @current_player = @players[1]
    end

end

g = Game.new
g.play
# k = Knight.new(:white, Board.new, [0, 1])
# k.board.print_board([0,1])
# p k.move_diffs