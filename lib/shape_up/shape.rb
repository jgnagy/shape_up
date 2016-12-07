module ShapeUp
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

    def validate_number(n)
      unless (n.is_a?(Numeric) || n.respond_to?(:to_numeric)) && n > 0
        raise "#{n} is not a valid numerical input"
      end
    end
  end
end
