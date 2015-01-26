module SportsDataApi
  module Golf
    class Course

      attr_reader :course_hash

      # simple data attributes
      SIMPLE_ATTRIBUTES = [:id, :name, :yardage, :par]
      SIMPLE_ATTRIBUTES.each do |attr|
        attr_reader attr
      end

      # relationship attributes
      attr_reader :holes

      def initialize(args = {})
        @course_hash = args[:course_hash]
        set_attributes
      end

      private

        def set_attributes
          SIMPLE_ATTRIBUTES.each do |attr|
            instance_variable_set("@#{attr.to_s}".to_sym, @course_hash[attr.to_s])
          end
          set_holes
        end

        def set_holes
          @holes = course_hash["holes"].map do |hole_hash|
            Hole.new(hole_hash: hole_hash)
          end
        end

    end
  end
end