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
        return false
    end
end
