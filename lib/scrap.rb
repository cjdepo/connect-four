def play(token, column,, new_board=[])
    @board.map.with_index do |row, row_index|
        p row_index
        # if last row and nil, place token in current row and return new row
        if row_index == @board.length-1 && row[column-1] == nil
            p 'hiiii'
            row[column-1] = token
            p @board
        #elsif row contains nil and not last row, return row
        elsif row[column-1] == nil
        @e
        #elsif row is not nil, place token in row above
        elsif row[column-1] != nil
            p 'hi'
            if row_index == 0
                p 'hii'
                puts "\nThis column is full."
                break
            else
                p 'hiii'
                @board[row_index-1][column-1] = token
            end
        end
    end
end


def play(token, column)
    current_board = @board
    new_board = current_board.each_with_index.reduce([]) do |new_board, (row, row_index)|
        new_row = row
        if landed == true
            new_board << row
        elsif row_index == @board.length-1 && row[column-1] == nil
            p 'last row contains nil'
            new_row[column-1] = token
            new_board << new_row
        elsif row[column-1] == nil
            p 'row contains nil'
            new_board << row
        elsif row[column-1] != nil
            p 'row does not contian nil'
            if row_index == 0
                p 'and its first row'
                return puts "\nThis column is full."
            else
                p 'and its not first row'
                new_prev_row = new_board.pop
                new_prev_row[column-1] = token
                new_board << new_prev_row
                new_board << new_row
                landed = true
            end
        end
    end
    new_board
end


def play(token, column)
    new_board = []
    until @board.empty?
        bottom_row = @board[-1]
        if bottom_row[column-1] == nil
            row = @board.pop
            row[column-1] = token
            new_board.unshift(row)
        elsif bottom_row[column-1]
            new_board.unshift(@board.pop)
        end
    end
end

def play(token, column, i=0, new_board=[], current_board=@board)
    i += 1
    row = current_board.shift
    if current_board.empty? && row[column-1] == nil
        row[column-1] = token
        return row
    elsif row[column-1] ==  nil
        next_row = current_board[0]
        if next_row[column-1] != nil
            row = current_board.shift
            row[column-1] = token
            return row
        else
            new_board << play(token, column, i, new_board)
        end
    end
end

def play(token, column)
    new_board = []
    current_board = @board.clone
    until current_board.empty?
        bottom_row = current_board[-1]
        #if you find a nil, put in new token value, and unshift this and all higher rows the same as board
        if bottom_row[column-1] == nil
            p 'found empty row'
            row = current_board.pop
            row[column-1] = token
            new_board.unshift(row)
            until current_board.empty?
                new_board.unshift(current_board.pop)
            end
        #elsif you find a value, unshift
        elsif bottom_row[column-1]
            p 'found full row'
            new_board.unshift(current_board.pop)
        end
    end
    p new_board
    @board = new_board
end




