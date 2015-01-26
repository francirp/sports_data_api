module SportsDataApi
  module Golf
    class Player

      attr_reader :player_hash, :players_statistics, :year

      # simple data attributes
      SIMPLE_ATTRIBUTES = [:id, :first_name, :last_name, :height, :weight, :birthday, :country, :residence, :birth_place, :member, :updated, :college, :turned_pro, :seed, :ball_maker, :club_maker]
      SIMPLE_ATTRIBUTES.each do |attr|
        attr_reader attr
      end

      def initialize(args = {})
        @player_hash = args[:player_hash]
        @year = args[:year]
        set_attributes
      end

      def statistics(year = year)
        SeasonStatistics.find_statistic(id, year)
      end

      private

        def set_attributes
          SIMPLE_ATTRIBUTES.each do |attr|
            instance_variable_set("@#{attr.to_s}".to_sym, @player_hash[attr.to_s])
          end
        end

    end
  end
end