#spec/connect_four.rb
require_relative '../lib/game'

describe Game do

    describe '#win?' do
    subject(:game) { described_class.new}
        context 'when checking by row' do
            it 'returns true when four in a row' do
                row = [nil, nil, nil, nil, nil, nil, nil]
                win_row = [nil, 'O', 'O', 'O', 'O', nil, nil]
                board = []
                board.push row
                board.push win_row
                4.times { board.push row }
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be true
            end
            it 'returns false when three in a row' do
                row = [nil, nil, nil, nil, nil, nil, nil]
                lose_row = [nil, 'O', 'O', 'O', nil, nil, nil]
                board = []
                board.push row
                board.push lose_row
                4.times { board.push row }
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be false
            end
            it 'returns false when two in a row, nil, then three in a row' do
                row = [nil, nil, nil, nil, nil, nil, nil]
                lose_row = [nil, 'O', 'O', nil, 'O', 'O', 'O']
                board = []
                board.push row
                board.push lose_row
                4.times { board.push row }
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be false
            end
            it 'returns true when seven in a row' do
                row = [nil, nil, nil, nil, nil, nil, nil]
                win_row = ['O', 'O', 'O', 'O', 'O', 'O', 'O']
                board = []
                board.push row
                board.push win_row
                4.times { board.push row }
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be true
            end
        end
        context 'when winning by column' do
            it 'returns true when four in a row' do
                o_row = [nil, 'O', nil, nil, nil, nil, nil]
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                board = []
                board.push empty_row
                4.times { board.push o_row }
                board.push empty_row
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be true
            end
            it 'returns false when three in a row' do
                o_row = [nil, nil, 'O', nil, nil, nil, nil]
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                board = []
                board.push empty_row
                3.times { board.push o_row }
                board.push empty_row
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be false
            end
            it 'returns false when two in a row, nil, and then three in a row' do
                o_row = [nil, nil, nil, nil, nil, nil, 'O']
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                board = []
                2.times {board.push o_row }
                board.push empty_row
                3.times {board.push o_row}
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be false
            end
            it 'returns true when six in a row' do
                o_row = [nil, nil, nil, nil, nil, nil, 'O']
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                board = []
                6.times { board.push o_row }
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be true
            end
        end
        context 'when winning by down diagonal' do
            it 'returns true when four in a row' do
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                two_row = [nil, 'O', nil, nil, nil, nil, nil]
                three_row = [nil, nil, 'O', nil, nil, nil, nil]
                four_row = [nil, nil, nil, 'O', nil, nil, nil]
                five_row = [nil, nil, nil, nil, 'O', nil, nil]
                board = [empty_row, two_row, three_row, four_row, five_row, empty_row]
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be true
            end
            it 'returns false when three in a row' do
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                three_row = [nil, nil, 'O', nil, nil, nil, nil]
                four_row = [nil, nil, nil, 'O', nil, nil, nil]
                five_row = [nil, nil, nil, nil, 'O', nil, nil]
                board = [empty_row, empty_row, three_row, four_row, five_row, empty_row]
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be false
            end
            it 'returns false when two in a row, nil, then three in a row' do
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                one_row = ['O', nil, nil, nil, nil, nil, nil]
                two_row = [nil, 'O', nil, nil, nil, nil, nil]
                four_row = [nil, nil, nil, 'O', nil, nil, nil]
                five_row = [nil, nil, nil, nil, 'O', nil, nil]
                six_row = [nil, nil, nil, nil, nil, '0', nil]
                board = [one_row, two_row, four_row, five_row, six_row]
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be false
            end
            it 'returns true when six in a row' do
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                one_row = ['O', nil, nil, nil, nil, nil, nil]
                two_row = [nil, 'O', nil, nil, nil, nil, nil]
                three_row = [nil, nil, 'O', nil, nil, nil, nil]
                four_row = [nil, nil, nil, 'O', nil, nil, nil]
                five_row = [nil, nil, nil, nil, 'O', nil, nil]
                six_row = [nil, nil, nil, nil, nil, '0', nil]
                board = [empty_row, two_row, three_row, four_row, five_row, empty_row]
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be true
            end
        end
        context 'when winning by up diagonal' do
            it 'returns true when four in a row' do
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                two_row = [nil, 'O', nil, nil, nil, nil, nil]
                three_row = [nil, nil, 'O', nil, nil, nil, nil]
                four_row = [nil, nil, nil, 'O', nil, nil, nil]
                five_row = [nil, nil, nil, nil, 'O', nil, nil]
                board = [empty_row, two_row, three_row, four_row, five_row, empty_row]
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be true 
            end
            it 'returns false when three in a row' do
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                three_row = [nil, nil, 'O', nil, nil, nil, nil]
                four_row = [nil, nil, nil, 'O', nil, nil, nil]
                five_row = [nil, nil, nil, nil, 'O', nil, nil]
                board = [empty_row, empty_row, five_row, four_row, three_row, empty_row]
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be false
            end
            it 'returns false when three in a row, nil, then two in a row' do
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                one_row = ['O', nil, nil, nil, nil, nil, nil]
                two_row = [nil, 'O', nil, nil, nil, nil, nil]
                four_row = [nil, nil, nil, 'O', nil, nil, nil]
                five_row = [nil, nil, nil, nil, 'O', nil, nil]
                six_row = [nil, nil, nil, nil, nil, '0', nil]
                board = [six_row, five_row, four_row, two_row, one_row]
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be false
            end
            it 'returns true when six in a row' do
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                one_row = ['O', nil, nil, nil, nil, nil, nil]
                two_row = [nil, 'O', nil, nil, nil, nil, nil]
                three_row = [nil, nil, 'O', nil, nil, nil, nil]
                four_row = [nil, nil, nil, 'O', nil, nil, nil]
                five_row = [nil, nil, nil, nil, 'O', nil, nil]
                six_row = [nil, nil, nil, nil, nil, 'O', nil]
                board = [six_row, five_row, four_row, three_row, two_row, one_row]
                game.instance_variable_set(:@board, board)
                expect(game.win?('O')).to be true
            end
        end
    end
    
    describe '#play' do
        subject(:game) { described_class.new }
        it 'adds to bottom row when empty board' do
            new_board = game.play('O', 4)
            expect(game.board[5][3]).to eq('O')
            expect(game.board[4][3]).to eq(nil)
        end
        it 'adds to both bottom rows when two tokens added to empty board' do
            2.times { game.play('O', 3) }
            expect(game.board[5][2]).to eq('O')
            expect(game.board[4][2]).to eq('O')
            expect(game.board[3][2]).to eq(nil)
        end
        it 'fills entire column when played 6 times' do
            6.times { game.play('O', 5) }
            expect(game.board[5][4]).to eq('O')
            expect(game.board[4][4]).to eq('O')
            expect(game.board[3][4]).to eq('O')
            expect(game.board[2][4]).to eq('O')
            expect(game.board[1][4]).to eq('O')
            expect(game.board[0][4]).to eq('O')
        end
        it 'returns column full message when column full' do
            6.times { game.play('O', 5) }
            expect(game).to receive(:puts).with("This column is filled!")
            game.play('O', 5)
        end
    end
    
    describe '#run_game' do
        subject(:game) { described_class.new }
        it 'when player 1 wins returns puts with player 1 wins message' do
            win_phrase = "\n\nPlayer 1 wins!!!\n\n"
            allow(game).to receive(:player_input).and_return(3, 4, 3, 4, 3, 4, 3)
            expect{ game.run_game }.to output(include(win_phrase)).to_stdout
        end
        
        it 'when player 2 wins it returns puts with player 2 wins message' do
            win_phrase = "\n\nPlayer 2 wins!!!\n\n"
            allow(game).to receive(:player_input).and_return(1, 4, 3, 4, 3, 4, 3, 4)
            expect{ game.run_game }.to output(include(win_phrase)).to_stdout
        end
    end
end


