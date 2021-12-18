#/lib/main.rb

class Game

    def initialize
        row = [nil, nil, nil, nil, nil, nil, nil]
        @board = []
        6.times { @board.push row }
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

        # diag_down_board = []
        # diag_down_board = @board.reduce([]) do |new_board, row|
        #     row = 
        #     new_board[] << row
            
    
        
        
        return false
    end
end

game = Game.new
p game.win?
