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
                expect(game.win?).to be true
            end
            it 'returns false when three in a row' do
                row = [nil, nil, nil, nil, nil, nil, nil]
                lose_row = [nil, 'O', 'O', 'O', nil, nil, nil]
                board = []
                board.push row
                board.push lose_row
                4.times { board.push row }
                game.instance_variable_set(:@board, board)
                expect(game.win?).to be false
            end
            it 'returns false when two in a row, nil, then three in a row' do
                row = [nil, nil, nil, nil, nil, nil, nil]
                lose_row = [nil, 'O', 'O', nil, 'O', 'O', 'O']
                board = []
                board.push row
                board.push lose_row
                4.times { board.push row }
                game.instance_variable_set(:@board, board)
                expect(game.win?).to be false
            end
            it 'returns true when seven in a row' do
                row = [nil, nil, nil, nil, nil, nil, nil]
                win_row = ['O', 'O', 'O', 'O', 'O', 'O', 'O']
                board = []
                board.push row
                board.push win_row
                4.times { board.push row }
                game.instance_variable_set(:@board, board)
                expect(game.win?).to be true
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
                expect(game.win?).to be true
            end
            it 'returns false when three in a row' do
                o_row = [nil, nil, 'O', nil, nil, nil, nil]
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                board = []
                board.push empty_row
                3.times { board.push o_row }
                board.push empty_row
                game.instance_variable_set(:@board, board)
                expect(game.win?).to be false
            end
            it 'returns false when two in a row, nil, and then three in a row' do
                o_row = [nil, nil, nil, nil, nil, nil, 'O']
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                board = []
                2.times {board.push o_row }
                board.push empty_row
                3.times {board.push o_row}
                game.instance_variable_set(:@board, board)
                expect(game.win?).to be false
            end
            it 'returns true when six in a row' do
                o_row = [nil, nil, nil, nil, nil, nil, 'O']
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                board = []
                6.times { board.push o_row }
                game.instance_variable_set(:@board, board)
                expect(game.win?).to be true
            end
        end
        context 'when winning by diagonal' do
            xit 'returns true when four in a row' do
                empty_row = [nil, nil, nil, nil, nil, nil, nil]
                two_row = [nil, 'O', nil, nil, nil, nil, nil]
                three_row = [nil, nil, 'O', nil, nil, nil, nil]
                four_row = [nil, nil, nil, 'O', nil, nil, nil]
                five_row = [nil, nil, nil, nil, 'O', nil, nil]
                board = [empty_row, two_row, three_row, four_row, five_row, empty_row]
                game.instance_variable_set(:@board, board)
                expect(game.win?).to be true
            end
        end
    end
end

