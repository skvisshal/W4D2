require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"


class Display

    def initialize (board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        exit = false
        until exit
            system("clear")
            @board.print_board(@cursor.cursor_pos)
            @cursor.get_input


        end

    end

end

d = Display.new(Board.new)
d.render