
require_relative "required_files.rb"

class Player

    attr_reader :color, :disp

    def initialize(color, disp)
        @color = color
        @disp = disp
    end



end

class HumanPlayer < Player

    def make_move(board)
        pos1 = disp.render
        pos2 = disp.render
        return [pos1, pos2]
    end

end

class Computer < Player

    def make_move(board)


    end


end