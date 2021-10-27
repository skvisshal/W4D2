require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"


class Display

    def initialize (board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
        @start = []
        @end = []
    end

    def render
        exit = false
        until exit
            system("clear")
            @board.print_board(@cursor.cursor_pos)
            answer = @cursor.get_input
            exit = true if answer    
        end
        @cursor.cursor_pos.dup
    end

end