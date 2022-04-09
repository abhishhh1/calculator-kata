module Calculator
  module Public
    class Multiply < Base
      def process
        numbers.inject(:*)
      end
    end
  end
end