# /lib/main.rb
require_relative 'player'

class Game
    attr_reader :board, :player1, :player2

    def initialize
        row = [nil, nil, nil, nil, nil, nil, nil]
        @board = Array.new(6).map{ Array.new(7) }
        @player1 = Player.new(1, 'O')
        @player2 = Player.new(2, 'X')
    end

    def win?(token)
        @board.each_with_index do |row, i|
            row.reduce(0) do |count, value|
                if value == token
                    count += 1
                    if count == 4
                        return true
                    end
                    count
                else
                    count = 0
                end
            end
        end
        #column
        
        @board.reduce([0, 0, 0, 0, 0, 0, 0]) do |win_count, row|
            row.each_with_index.reduce(win_count) do |win_count, (v, i)|
                if row[i] == token
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
                if row[i] == token
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
                if row[i] == token
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
        if @board[0][column-1] != nil
            puts 'This column is filled!'
            return @board
        end
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
    
    def clear_board
        @board = Array.new(6).map{ Array.new(7) }
    end

    def display_board
        p ['1', '2', '3', '4', '5', '6', '7']
        @board.each{ |row| p row }
    end

    def player_input
        puts "\n\nEnter a #(1-7) to choose where to place your chip:"
        display_board
        puts "\n"
        column = 0
        until column.class == Integer && column <= 7 && column >= 1
            column = gets.chomp.to_i
            if column.class != Integer || column <= 1 || column >= 7
                puts "You must enter a number between 1 and 7"
            end
        end
        column
    end

    def run_game
        player = @player2
        until self.win?('O') || self.win?('X')
            if player == @player1
                player = @player2
            elsif player == @player2
                player = @player1
            end
            column = player_input
            play(player.token, column)
        end
        if player == @player1 
            puts "\n\nPlayer 1 wins!!!\n\n"
        elsif player == @player2
            puts "\n\nPlayer 2 wins!!!\n\n"
        end
    end



end


