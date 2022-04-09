module Calculator
  class Parser
    attr_reader :numbers

    def initialize(numbers)
      @numbers = numbers.to_s
    end

    def parse
      # handle line seperated values
      @numbers = numbers.include?('\n') ? numbers.gsub!('\n', ',') : numbers
      # convert splitted numbers into integer
      @numbers = numbers.split(',').map { |number| number.try(&:to_i) }
      numbers
    end
  end
end
