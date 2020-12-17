# frozen_string_literal: true

module ShapeUp
  # All shapes should subclass this class
  class Shape
    def unit
      @unit ||= 'unit'
    end

    def unit=(unit_of_measure)
      @unit = unit_of_measure.to_s
    end

    def precision
      @precision ||= 10
    end

    private

    def validate_number(num)
      error = "#{num} is not a valid numerical input"
      raise error unless (num.is_a?(Numeric) || num.respond_to?(:to_numeric)) && num.positive?
    end
  end
end
