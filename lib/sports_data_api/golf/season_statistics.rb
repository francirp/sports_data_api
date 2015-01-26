module SportsDataApi
  module Golf
    class SeasonStatistics

      attr_reader :season_statistics_hash, :player_statistic_hashes, :players, :year

      def initialize(args = {})
        @season_statistics_hash = args[:season_statistics_hash]
        @year = args[:year].try(:to_i)
        @player_statistic_hashes = @season_statistics_hash["players"]
        @players = generate_players_statistics
      end

      def self.find_statistic(player_id, year)
        @season_players ||= Golf.season_statistics(year).players
        @season_players.detect{ |player| player.id == player_id }
      end

      private

        def generate_players_statistics
          player_statistic_hashes.map do |player_statistics_hash|
            PlayerStatistics.new(year: year, player_statistics_hash: player_statistics_hash)
          end
        end

    end
  end
end