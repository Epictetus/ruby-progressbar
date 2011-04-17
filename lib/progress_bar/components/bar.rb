module ProgressBar
  module Components
    class Bar
      include Progressable

      OPTIONS                    = [:total, :progress_mark, :starting_at]

      DEFAULT_PROGRESS_MARK      = 'o'

      attr_reader               :progress_mark

      def initialize(options = {})
        initialize_progress(options)

        @reversed        = false
        @progress_mark   = options[:progress_mark]      || DEFAULT_PROGRESS_MARK
      end

      def reverse
        @reversed = !@reversed
      end

      def reversed?
        @reversed
      end

      def to_s(length)
        @length = length
        reversed? ? "#{empty_string}#{complete_string}" : "#{complete_string}#{empty_string}"
      end

      private
        attr_reader :length

        def complete_string
          @progress_mark * completed_length
        end

        def completed_length
          length * percentage_completed / 100
        end

        def empty_string
          " " * (length - completed_length)
        end
    end
  end
end