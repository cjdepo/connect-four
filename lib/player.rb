# lib/player

class Player
    attr_reader :player_number, :token

    def initialize(player_number, token)
        @player_number = player_number
        @token = token
    end
end
