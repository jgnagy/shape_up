module ShapeUp
  class Side
    include Measurable
    include Comparable

    attr_reader :shape, :label

    def initialize(shape, label, length)
      @shape  = shape
      @label  = label
      @length = length
    end

    def length
      @length.round(shape.precision)
    end

    def altitude
      (shape.area / (@length / 2)).round(shape.precision)
    end

    def to_numeric
      @length
    end
  end
end
