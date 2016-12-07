module ShapeUp
  module Measurable
    def coerce(other)
      [other, to_numeric]
    end

    def +(other)
      to_numeric + other
    end

    def -(other)
      to_numeric - other
    end

    def *(other)
      to_numeric * other
    end

    def /(other)
      to_numeric / other
    end

    def **(other)
      to_numeric**other
    end

    def <=>(other)
      if other.respond_to?(:to_numeric)
        to_numeric <=> other.to_numeric
      elsif other.is_a?(Numeric)
        to_numeric <=> other
      elsif other.respond_to?(:to_f)
        to_numeric <=> other.to_f
      else
        nil
      end
    end
  end
end
