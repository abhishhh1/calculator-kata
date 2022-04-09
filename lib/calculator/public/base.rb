module Calculator
  module Public
    class Base
      attr_reader :numbers
      attr_accessor :errors

      def initialize(numbers)
        @numbers = ::Calculator::Parser.new(numbers).parse
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
