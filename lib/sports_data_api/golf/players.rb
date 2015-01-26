module SportsDataApi
  module Golf
    class Players

      attr_reader :year, :players_hash, :player_hashes, :players, :players_statistics

      def initialize(args = {})
        @year = args[:year].try(:to_i)
        @players_hash = args[:players_hash]
        @player_hashes = @players_hash["players"]
        @players = generate_players
      end

      private

        def generate_players
          player_hashes.map do |player_hash|
            Player.new(year: year, player_hash: player_hash)
          end
        end

    end
  end
end