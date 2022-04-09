module Calculator
  module Public
    class Base
      attr_reader :numbers
      attr_accessor :errors

      def initialize(number)
        @numbers = ::Calculator::Parser.new(number).parse
      end

      def calculate
        @errors = ::Calculator::Validator.new(numbers).validate
        return if errors.present?

        process
      end

      private

      def process
        raise NotImplementedError
      end
    end
  end
end
