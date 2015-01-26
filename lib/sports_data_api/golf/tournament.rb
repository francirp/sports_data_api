module SportsDataApi
  module Golf
    class Tournament

      # api attributes
      attr_reader :tournament_hash, :year

      # simple data attributes
      SIMPLE_ATTRIBUTES = [:id, :name, :event_type, :purse, :winning_share, :points, :start_date, :end_date, :year, :status, :coverage]
      SIMPLE_ATTRIBUTES.each do |attr|
        attr_reader attr
      end

      # relationship attributes
      attr_reader :venue


      def initialize(args = {})
        @tournament_hash = args[:tournament_hash]
        @year = args[:year].try(:to_i)
        set_attributes
      end

      private

        def set_attributes
          SIMPLE_ATTRIBUTES.each do |attr|
            instance_variable_set("@#{attr.to_s}".to_sym, @tournament_hash[attr.to_s])
          end
          @venue = Venue.new(venue_hash: @tournament_hash['venue'])
        end

    end
  end
end