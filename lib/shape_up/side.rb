# frozen_string_literal: true

module ShapeUp
  # Used to describe the length of polygon boundaries
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
      (shape.area / (@length / 2.0)).round(shape.precision)
    end

    def positive?
      length.positive?
    end

    def to_numeric
      @length
    end
  end
end
