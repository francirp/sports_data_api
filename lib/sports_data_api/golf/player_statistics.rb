module SportsDataApi
  module Golf
    class PlayerStatistics

      # api attributes
      attr_reader :player_statistics_hash, :year, :id

      # simple data attributes
      SIMPLE_ATTRIBUTES = [:drive_avg, :cuts_made, :cuts, :drive_acc, :earnings_rank, :events_played, :points_rank, :points, :first_place, :gir_pct, :hole_proximity_avg, :scoring_avg, :scrambling_pct, :earnings, :second_place, :strokes_gained, :third_place, :top_10, :top_25, :withdrawals, :world_rank]
      SIMPLE_ATTRIBUTES.each do |attr|
        attr_reader attr
      end

      def initialize(args = {})
        @player_hash = args[:player_statistics_hash]
        @player_statistics_hash = args[:player_statistics_hash]["statistics"]
        @id = @player_hash["id"]
        @year = args[:year].try(:to_i)
        set_attributes
      end

      private

        def set_attributes
          SIMPLE_ATTRIBUTES.each do |attr|
            instance_variable_set("@#{attr.to_s}".to_sym, @player_statistics_hash[attr.to_s])
          end
        end

    end
  end
end
