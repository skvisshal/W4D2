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
            case answer
            when :exit
                exit = true
            when :return
                exit = true
            end
        end
        @cursor.cursor_pos
    end

end

d = Display.new(Board.new)
d.render