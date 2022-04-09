module Calculator
  class Validator
    attr_reader :numbers, :errors

    def initialize(numbers)
      @numbers = numbers
      @errors ||= []
    end

    def validate
      # validate negative numbers
      errors << 'Negative Numbers' unless numbers.all?(&:positive?)
      # validate invalid numbers
      errors << 'Invalid Numbers' unless numbers.reject(&:empty?) == numbers
      errors
    end
  end
end
