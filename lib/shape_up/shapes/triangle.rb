# frozen_string_literal: true

module ShapeUp
  module Shapes
    # Object-oriented representation of a Triangle (http://mathworld.wolfram.com/Triangle.html)
    class Triangle < Polygon
      # rubocop:disable Naming/MethodParameterName
      def initialize(a, b, c, opts = {})
        @precision = opts[:precision] || 10
        [a, b, c].each { |s| validate_number s }
        @a = Side.new(self, :a, a.is_a?(Side) ? a.to_numeric : a)
        @b = Side.new(self, :b, b.is_a?(Side) ? b.to_numeric : b)
        @c = Side.new(self, :c, c.is_a?(Side) ? c.to_numeric : c)
        error = "Invalid Triangle Sides [#{[a, b, c].join(', ')}]"
        raise error unless validate_triangle
      end
      # rubocop:enable Naming/MethodParameterName

      # Side a
      attr_reader :a

      alias side_a a

      # Side b
      attr_reader :b

      alias side_b b

      # Side c
      attr_reader :c

      alias side_c c

      # Angle A
      # Uses the Law of Cosines (http://mathworld.wolfram.com/LawofCosines.html)
      # Using inverse cosine via arccosine (radians), then converting to degrees
      def angle_a
        Angle.new(
          self,
          :a,
          (
            (
              Math.acos((b**2 + c**2 - a**2) / (2.0 * b * c)) * 180
            ) / Math::PI
          )
        )
      end

      # Angle B
      # Uses the Law of Cosines (http://mathworld.wolfram.com/LawofCosines.html)
      # Using inverse cosine via arccosine (radians), then converting to degrees
      def angle_b
        Angle.new(
          self,
          :b,
          (
            (
              Math.acos((a**2 + c**2 - b**2) / (2.0 * a * c)) * 180
            ) / Math::PI
          )
        )
      end

      # Angle C
      # Uses the Law of Cosines (http://mathworld.wolfram.com/LawofCosines.html)
      # Using inverse cosine via arccosine (radians), then converting to degrees
      def angle_c
        Angle.new(
          self,
          :c,
          (
            (
              Math.acos((a**2 + b**2 - c**2) / (2.0 * a * b)) * 180
            ) / Math::PI
          )
        )
      end

      # An Array of the Angles of the Triangle
      def angles
        [angle_a, angle_b, angle_c]
      end

      # Calculate the area of a Triangle using Heron's Formula
      # Rearrangement required for numerical stability (thanks to floats)
      # http://mathworld.wolfram.com/HeronsFormula.html
      # https://en.wikipedia.org/wiki/Heron's_formula#Numerical_stability
      def area
        x, y, z = sides.sort
        (
          0.25 * Math.sqrt((x + (y + c)) * (z - (x - y)) * (z + (x - y)) * (x + (y - z)))
        ).to_f.round(precision)
      end

      # the length of the line that bisects an angle based on the lengths of sides
      # https://en.wikipedia.org/wiki/Bisection#Lengths
      def bisector_length(opposite, adjacent1, adjacent2)
        other_sides = [adjacent1, adjacent2]
        2 * Math.sqrt(
          (other_sides.inject(:*) * semiperimeter) * (semiperimeter - opposite)
        ) / other_sides.inject(:+)
      end

      # Create two Triangles, formed by bisecting an angle
      # http://mathworld.wolfram.com/AngleBisector.html
      # rubocop:disable Metrics/AbcSize
      def bisect_on_angle(angle)
        label = angle.is_a?(Symbol) ? angle : angle.label

        # if self is angle A, these are sides [:b, :c]
        other_labels = sides.map(&:label) - [label]
        other_sides = [send(other_labels.first), send(other_labels.last)]
        degrees = send("angle_#{label}".to_sym).to_numeric

        # Calculate the length of the bisector of this angle
        bisector = bisector_length(send(label), other_sides.first, other_sides.last)

        # segment of AC with ratio of BA
        line_segment1 = side_from_sas(other_sides.first, (degrees / 2), bisector)

        # segment of AC with ratio of BC
        line_segment2 = side_from_sas(other_sides.last, (degrees / 2), bisector)

        # return the resulting triangles formed by the bisection
        [
          self.class.new(line_segment1, other_sides.first.length, bisector, precision: precision),
          self.class.new(line_segment2, other_sides.last.length, bisector, precision: precision)
        ]
      end
      # rubocop:enable Metrics/AbcSize

      # Inradius (http://mathworld.wolfram.com/Inradius.html)
      def inradius
        (area / semiperimeter).to_f.round(precision)
      end

      # Is this an acute Triangle? (http://mathworld.wolfram.com/AcuteTriangle.html)
      def acute?
        angles.max < 90.0
      end

      # Is this an equilateral Triangle? (http://mathworld.wolfram.com/EquilateralTriangle.html)
      def equilateral?
        type == :equilateral
      end

      # Is this an isosceles Triangle? (http://mathworld.wolfram.com/IsoscelesTriangle.html)
      def isosceles?
        type == :isosceles
      end

      # Is this an oblique Triangle? (http://mathworld.wolfram.com/ObliqueTriangle.html)
      def oblique?
        !right?
      end

      # Is this an obtuse Triangle? (http://mathworld.wolfram.com/ObtuseTriangle.html)
      def obtuse?
        angles.map(&:degrees).max > 90.0
      end

      # Is this a right Triangle? (http://mathworld.wolfram.com/RightTriangle.html)
      def right?
        angles.map(&:degrees).include? 90.0
      end

      # Is this a scalene Triangle? (http://mathworld.wolfram.com/ScaleneTriangle.html)
      def scalene?
        type == :scalene
      end

      # Semiperimeter (http://mathworld.wolfram.com/Semiperimeter.html)
      def semiperimeter
        (perimeter * 0.5)
      end

      # Return an Array of the Sides of the Triangle
      def sides
        [a, b, c]
      end

      # Calculate a side from SAS
      # http://mathworld.wolfram.com/LawofCosines.html
      def side_from_sas(side1, angle, side2)
        Math.sqrt(
          (
            side1**2 + side2**2
          ) - (
            2 * side1 * side2 * Math.cos(
              (angle * (Math::PI / 180))
            )
          )
        )
      end

      def type
        # http://mathworld.wolfram.com/EquilateralTriangle.html
        return :equilateral if a == b && b == c
        # http://mathworld.wolfram.com/IsoscelesTriangle.html
        return :isosceles if a == b || b == c || a == c

        # http://mathworld.wolfram.com/ScaleneTriangle.html
        :scalene
      end

      # Is this a valid Triangle?
      def valid?
        validate_triangle
        true
      end

      # Create a new Triangle based on the current one with a different precision
      def to_precision(num)
        self.class.new(a, b, c, precision: num)
      end

      private

      # http://mathworld.wolfram.com/TriangleInequality.html
      def validate_triangle
        a + b > c && a + c > b && b + c > a ? true : false
      end
    end
  end
end
