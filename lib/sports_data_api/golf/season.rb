module SportsDataApi
  module Golf
    class Season

      attr_reader :year, :tournament_hashes, :tournaments

      def initialize(args = {})
        @year = args[:year].try(:to_i)
        @season_hash = args[:season_hash]
        @tournament_hashes = @season_hash["tournaments"]
        @tournaments = generate_tournaments
      end

      private

        def generate_tournaments
          tournament_hashes.map do |tournament|
            Tournament.new(year: year, tournament_hash: tournament)
          end
        end

    end
  end
end