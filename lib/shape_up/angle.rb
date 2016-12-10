module ShapeUp
  # Angle onject is used by Polygons to describe side intersections
  class Angle
    include Measurable
    include Comparable

    attr_reader :shape, :label

    def initialize(shape, label, degrees)
      @shape   = shape
      @label   = label
      @degrees = degrees
    end

    def degrees
      @degrees.round(shape.precision)
    end

    def radians
      (@degrees * (Math::PI / 180)).round(shape.precision)
    end

    def to_numeric
      @degrees
    end
  end
end
