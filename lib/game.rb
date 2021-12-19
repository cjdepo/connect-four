# /lib/main.rb

class Game
    attr_reader :board

    def initialize
        row = [nil, nil, nil, nil, nil, nil, nil]
        @board = Array.new(6).map{ Array.new(7) }
    end

    def win?
        @board.each do |row|
            row.reduce(0) do |count, value|
                if value == 'O'
                    count += 1
                    if count == 4
                        return true
                    end
                    count
                elsif value == nil
                    count = 0
                end
            end
        end
        #column
        
        @board.reduce([0, 0, 0, 0, 0, 0, 0]) do |win_count, row|
            row.each_with_index.reduce(win_count) do |win_count, (v, i)|
                if row[i] == 'O'
                    win_count[i] += 1
                elsif row[i] == nil
                    win_count[i] = 0
                end
                if win_count.any? { |column_count| column_count >= 4 ? true : false }
                    return true
                end
                win_count
            end
        end
        #diagonal(down slope)
        
        diag_down_board = @board.map.with_index do |row, i|
            new_row = row
            i.times { new_row += [nil]} 
            i.times { new_row.shift }
            new_row
        end
        diag_down_board.reduce([0, 0, 0, 0, 0, 0, 0]) do |win_count, row|
            row.each_with_index.reduce(win_count) do |win_count, (v, i)|
                if row[i] == 'O'
                    win_count[i] += 1
                elsif row[i] == nil
                    win_count[i] = 0
                end
                if win_count.any? { |column_count| column_count >= 4 ? true : false }
                    return true
                end
                win_count
            end
        end

        #diagonal(up slope)

        diag_up_board = @board.map.with_index do |row, row_index|
            new_row = row
            (@board.length - 1 - row_index).times { new_row += [nil]} 
            (@board.length - 1 - row_index).times { new_row.shift }
            new_row
        end
        
        diag_up_board.reduce([0, 0, 0, 0, 0, 0, 0]) do |win_count, row|
            row.each_with_index.reduce(win_count) do |win_count, (v, i)|
                if row[i] == 'O'
                    win_count[i] += 1
                elsif row[i] == nil
                    win_count[i] = 0
                end
                if win_count.any? { |column_count| column_count >= 4 ? true : false }
                    return true
                end
                win_count
            end
        end
        return false
    end
    
    def play(token, column)
        new_board = []
        until @board.empty?
            bottom_row = @board[-1]
            if bottom_row[column-1] == nil
                row = @board.pop
                row[column-1] = token
                new_board.unshift(row)
                until @board.empty?
                    new_board.unshift(@board.pop)
                end
            elsif bottom_row[column-1]
                new_board.unshift(@board.pop)
            end
        end
        @board = new_board
    end
    
    
end