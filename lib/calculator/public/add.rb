module Calculator
  module Public
    class Add < Base
      def process
        numbers.sum
      end
    end
  end
end
