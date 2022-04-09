module Calculator
  module Public
    class Multiply < Base
      def process(numbers)
        numbers.inject(:*)
      end
    end
  end
end