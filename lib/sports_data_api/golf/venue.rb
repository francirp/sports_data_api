module SportsDataApi
  module Golf
    class Venue

      attr_reader :venue_hash

      # simple data attributes
      ATTRIBUTES = [:id, :name, :city, :state, :zipcode, :country]
      ATTRIBUTES.each do |attr|
        attr_reader attr
      end

      # relationship attributes
      attr_reader :courses

      def initialize(args = {})
        @venue_hash = args[:venue_hash]
        set_attributes
      end

      private

        def set_attributes
          ATTRIBUTES.each do |attr|
            instance_variable_set("@#{attr.to_s}".to_sym, @venue_hash[attr.to_s])
          end
          set_courses
        end

        def set_courses
          @courses = venue_hash["courses"].map do |course_hash|
            Course.new(course_hash: course_hash)
          end
        end

    end
  end
end