module Calculator
  module Public
    class Base
      attr_reader :numbers, :operation
      attr_accessor :errors

      def initialize(numbers, operation)
        @numbers = ::Calculator::Parser.new(numbers).parse
        @operation = operation
      end

      def calculate
        @errors = ::Calculator::Validator.new(numbers).validate
        return unless errors.present?

        process(numbers)
      end

      private

      def process(numbers)
        raise NotImplementedError
      end
    end
  end
end
