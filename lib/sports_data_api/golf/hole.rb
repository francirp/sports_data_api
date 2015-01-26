module SportsDataApi
  module Golf
    class Hole

      attr_reader :hole_hash

      # simple data attributes
      ATTRIBUTES = [:number, :par, :yardage]
      ATTRIBUTES.each do |attr|
        attr_reader attr
      end

      def initialize(args = {})
        @hole_hash = args[:hole_hash]
        set_attributes
      end

      private

        def set_attributes
          ATTRIBUTES.each do |attr|
            instance_variable_set("@#{attr.to_s}".to_sym, @hole_hash[attr.to_s])
          end
        end

    end
  end
end