module SLIDEABLE

    @@HORIZONTAL_DIRS = []
    @@DIAGONAL_DIRS = []

    def horizontal_dirs #for rook
        x, y = @pos
        (0...8).each do |i|
            @@HORIZONTAL_DIRS << [x, i] unless i == y || !grow_unblocked_moves_in_dir(x, i)
            @@HORIZONTAL_DIRS << [i, y] unless i == x || !grow_unblocked_moves_in_dir(i, y)
        end
        @@HORIZONTAL_DIRS
    end

    def diagonal_dirs #for bishop
        x,y = @pos
        (1...8).each do |i|
            @@DIAGONAL_DIRS << [x + i, y + i] if @board.valid_pos?([x + i, y + i]) && grow_unblocked_moves_in_dir(x + i, y + i)
            @@DIAGONAL_DIRS << [x + i, y - i] if @board.valid_pos?([x + i, y - i]) && grow_unblocked_moves_in_dir(x + i, y - i)
            @@DIAGONAL_DIRS << [x - i, y + i] if @board.valid_pos?([x - i, y + i]) && grow_unblocked_moves_in_dir(x - i, y + i)
            @@DIAGONAL_DIRS << [x - i, y - i] if @board.valid_pos?([x - i, y - i]) && grow_unblocked_moves_in_dir(x - i, y - i)
        end
        @@DIAGONAL_DIRS
    end

    def moves #for queen
        @@DIAGONAL_DIRS + @@HORIZONTAL_DIRS
    end

    private
    def move_dirs

    end

    private
    def grow_unblocked_moves_in_dir(dx,dy)
        x,y = @pos 
        if dx == x || dy == y
            #this means its horizontal
            if dx == x 
                if y > dy 
                    (dy...y).each do |yvals|
                        return false if @board[[x, yvals]] != @board.null_piece
                    end
                else
                    ((y + 1)..dy).each do |yvals|
                        return false if @board[[x, yvals]] != @board.null_piece
                    end
                end
            else dy == y
                if x > dx
                    (dx...x).each do |xvals|
                        return false if @board[[xvals, y]] != @board.null_piece
                    end
                else
                    ((x + 1)..dx).each do |xvals|
                        return false if @board[[xvals, y]] != @board.null_piece
                    end
                end
            end
        else #this means its diagonal
            if dx > x && dy > y
                pos_x = x + 1
                pos_y = y + 1
                while pos_x <= dx
                    return false if @board[[pos_x, pos_y]] != @board.null_piece
                    pos_x += 1
                    pos_y += 1
                end
            elsif dx < x && dy > y
                pos_x = x - 1
                pos_y = y + 1
                while pos_y <= dy
                    return false if @board[[pos_x, pos_y]] != @board.null_piece
                    pos_x -= 1
                    pos_y += 1
                end
            elsif dx > x && dy < y
                pos_x = x + 1
                pos_y = y - 1
                while pos_x <= dx
                    return false if @board[[pos_x, pos_y]] != @board.null_piece
                    pos_x += 1
                    pos_y -= 1
                end
            else 
                pos_x = x - 1
                pos_y = y - 1
                while dx <= pos_x
                    return false if @board[[pos_x, pos_y]] != @board.null_piece
                    pos_x -= 1
                    pos_y -= 1
                end
            end
        end 
    end
end