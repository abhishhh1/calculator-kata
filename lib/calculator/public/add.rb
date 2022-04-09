module Calculator
  module Public
    class Add < Base
      def process(numbers)
        numbers.sum
      end
    end
  end
end
