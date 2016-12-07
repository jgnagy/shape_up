module ShapeUp
  class Polygon < Shape
    include Comparable

    def sides
      []
    end

    def perimeter
      sides.inject(:+) || 0
    end

    def similar?(other)
      low_prec = [precision, other.precision].sort.first
      to_precision(low_prec).angles.sort == other.to_precision(low_prec).angles.sort
    end

    def congruent?(other)
      self == other
    end

    def <=>(other)
      [sides.sort, angles.sort] <=> [other.sides.sort, other.angles.sort]
    end
  end
end
