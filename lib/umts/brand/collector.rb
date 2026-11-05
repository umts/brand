# frozen_string_literal: true

module UMTS
  module Brand
    class Collector
      def initialize(view, *fields)
        @view = view
        @fields = {}
        fields.each do |field|
          define_singleton_method(field) { |content = nil, &block| collect_or_return(field, content, &block) }
        end
      end

      private

      def collect_or_return(field, content, &block)
        if content
          @fields[field] = content
        elsif block
          @fields[field] = @view.capture(&block)
        else
          @fields[field]
        end
      end
    end
  end
end
