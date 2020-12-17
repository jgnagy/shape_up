# frozen_string_literal: true

require 'spec_helper'

describe ShapeUp::Shapes::Triangle do
  context 'with a low precision of 2', :low_precision do
    context 'attempting a 1,5,7 triangle' do
      it 'should raise an exception' do
        error = 'Invalid Triangle Sides [1, 5, 7]'
        expect do
          ShapeUp::Shapes::Triangle.new(1, 5, 7, precision: 2)
        end.to raise_error(error)
      end
    end

    context 'with a 3,4,5 triangle' do
      subject { ShapeUp::Shapes::Triangle.new(3, 4, 5, precision: 2) }

      describe '#right?' do
        it 'should be true' do
          expect(subject.right?).to eq(true)
        end
      end

      describe '#oblique?' do
        it 'should be false' do
          expect(subject.oblique?).to eq(false)
        end
      end

      describe '#obtuse?' do
        it 'should be false' do
          expect(subject.obtuse?).to eq(false)
        end
      end

      describe '#acute?' do
        it 'should be false' do
          expect(subject.acute?).to eq(false)
        end
      end

      describe '#scalene?' do
        it 'should be true' do
          expect(subject.scalene?).to eq(true)
        end
      end

      describe '#equilateral?' do
        it 'should be false' do
          expect(subject.equilateral?).to eq(false)
        end
      end

      describe '#isosceles?' do
        it 'should be false' do
          expect(subject.isosceles?).to eq(false)
        end
      end

      describe '#area' do
        it 'should be 6.0' do
          expect(subject.area).to eq(6.0)
        end
      end

      describe '#perimeter' do
        it 'should be 12.0' do
          expect(subject.perimeter).to eq(12.0)
        end
      end

      describe '#semiperimeter' do
        it 'should be 6.0' do
          expect(subject.semiperimeter).to eq(6.0)
        end
      end

      describe '#inradius' do
        it 'should be 1.0' do
          expect(subject.inradius).to eq(1.0)
        end
      end

      describe '#angle_a' do
        it 'should be 36.87 degrees' do
          expect(subject.angle_a.degrees).to eq(36.87)
        end

        it 'should be 0.64 radians' do
          expect(subject.angle_a.radians).to eq(0.64)
        end
      end

      describe '#angle_b' do
        it 'should be 53.13 degrees' do
          expect(subject.angle_b.degrees).to eq(53.13)
        end

        it 'should be 0.93 radians' do
          expect(subject.angle_b.radians).to eq(0.93)
        end
      end

      describe '#angle_c' do
        it 'should be 90.0 degrees' do
          expect(subject.angle_c.degrees).to eq(90.0)
        end

        it 'should be 1.57 radians' do
          expect(subject.angle_c.radians).to eq(1.57)
        end
      end

      describe '#side_a' do
        it 'should have a length of 3.0' do
          expect(subject.side_a.length).to eq(3.0)
        end

        it 'should have an altitude of 4.0' do
          expect(subject.side_a.altitude).to eq(4.0)
        end
      end

      describe '#side_b' do
        it 'should have a length of 4.0' do
          expect(subject.side_b.length).to eq(4.0)
        end

        it 'should have an altitude of 3.0' do
          expect(subject.side_b.altitude).to eq(3.0)
        end
      end

      describe '#side_c' do
        it 'should have a length of 5.0' do
          expect(subject.side_c.length).to eq(5.0)
        end

        it 'should have an altitude of 2.4' do
          expect(subject.side_c.altitude).to eq(2.4)
        end
      end

      describe '#congruent?' do
        it 'should be congruent with a 5.0,3,4 triangle' do
          t = ShapeUp::Shapes::Triangle.new(5.0, 3, 4, precision: 2)
          expect(subject.congruent?(t)).to eq(true)
        end

        it 'should not be congruent with a 3,6,7 triangle' do
          t = ShapeUp::Shapes::Triangle.new(3, 6, 7, precision: 2)
          expect(subject.congruent?(t)).to eq(false)
        end
      end

      describe '#similar?' do
        it 'should be similar to a 15,9,12 triangle' do
          t = ShapeUp::Shapes::Triangle.new(15, 9, 12, precision: 2)
          expect(subject.similar?(t)).to eq(true)
        end

        it 'should not be similar to a 3,6,7 triangle' do
          t = ShapeUp::Shapes::Triangle.new(3, 6, 7, precision: 2)
          expect(subject.similar?(t)).to eq(false)
        end
      end

      describe '#bisect_on_angle' do
        it 'should produce an ∠C bisector length of 2.42' do
          expect(subject.bisect_on_angle(:c).first.side_c.length).to eq(2.42)
        end
      end
    end

    context 'with a 1,1,√2 triangle' do
      subject { ShapeUp::Shapes::Triangle.new(1, 1, Math.sqrt(2), precision: 2) }

      describe '#right?' do
        it 'should be true' do
          expect(subject.right?).to eq(true)
        end
      end

      describe '#oblique?' do
        it 'should be false' do
          expect(subject.oblique?).to eq(false)
        end
      end

      describe '#obtuse?' do
        it 'should be false' do
          expect(subject.obtuse?).to eq(false)
        end
      end

      describe '#acute?' do
        it 'should be false' do
          expect(subject.acute?).to eq(false)
        end
      end

      describe '#scalene?' do
        it 'should be false' do
          expect(subject.scalene?).to eq(false)
        end
      end

      describe '#equilateral?' do
        it 'should be false' do
          expect(subject.equilateral?).to eq(false)
        end
      end

      describe '#isosceles?' do
        it 'should be true' do
          expect(subject.isosceles?).to eq(true)
        end
      end

      describe '#area' do
        it 'should be 0.5' do
          expect(subject.area).to eq(0.5)
        end
      end

      describe '#perimeter' do
        it 'should be 3.414213562373095' do
          expect(subject.perimeter).to eq(3.414213562373095)
        end
      end

      describe '#semiperimeter' do
        it 'should be 1.7071067811865475' do
          expect(subject.semiperimeter).to eq(1.7071067811865475)
        end
      end

      describe '#inradius' do
        it 'should be 0.29' do
          expect(subject.inradius).to eq(0.29)
        end
      end

      describe '#angle_a' do
        it 'should be 45.0 degrees' do
          expect(subject.angle_a.degrees).to eq(45.0)
        end

        it 'should be 0.79 radians' do
          expect(subject.angle_a.radians).to eq(0.79)
        end
      end

      describe '#angle_b' do
        it 'should be 45.0 degrees' do
          expect(subject.angle_b.degrees).to eq(45.0)
        end

        it 'should be 0.79 radians' do
          expect(subject.angle_b.radians).to eq(0.79)
        end
      end

      describe '#angle_c' do
        it 'should be 90.0 degrees' do
          expect(subject.angle_c.degrees).to eq(90.0)
        end

        it 'should be 1.57 radians' do
          expect(subject.angle_c.radians).to eq(1.57)
        end
      end

      describe '#side_a' do
        it 'should have a length of 1.0' do
          expect(subject.side_a.length).to eq(1.0)
        end

        it 'should have an altitude of 1.0' do
          expect(subject.side_a.altitude).to eq(1.0)
        end
      end

      describe '#side_b' do
        it 'should have a length of 1.0' do
          expect(subject.side_b.length).to eq(1.0)
        end

        it 'should have an altitude of 1.0' do
          expect(subject.side_b.altitude).to eq(1.0)
        end
      end

      describe '#side_c' do
        it 'should have a length of 1.41' do
          expect(subject.side_c.length).to eq(1.41)
        end

        it 'should have an altitude of 0.71' do
          expect(subject.side_c.altitude).to eq(0.71)
        end
      end

      describe '#congruent?' do
        it 'should be congruent with a 1,√2,1.0 triangle' do
          t = ShapeUp::Shapes::Triangle.new(1, Math.sqrt(2), 1.0)
          expect(subject.congruent?(t)).to eq(true)
        end

        it 'should not be congruent with a 3,6,7 triangle' do
          t = ShapeUp::Shapes::Triangle.new(3, 6, 7, precision: 2)
          expect(subject.congruent?(t)).to eq(false)
        end
      end

      describe '#similar?' do
        it 'should be similar to a 4,4,4√2 triangle' do
          t = ShapeUp::Shapes::Triangle.new(4, 4, 4 * Math.sqrt(2), precision: 2)
          expect(subject.similar?(t)).to eq(true)
        end

        it 'should not be similar to a 3,6,7 triangle' do
          t = ShapeUp::Shapes::Triangle.new(3, 6, 7, precision: 2)
          expect(subject.similar?(t)).to eq(false)
        end
      end

      describe '#bisect_on_angle' do
        it 'should produce an ∠C bisector length of 0.71' do
          expect(subject.bisect_on_angle(:c).first.side_c.length).to eq(0.71)
        end
      end
    end

    context 'with a 5,5,5 triangle' do
      subject { ShapeUp::Shapes::Triangle.new(5, 5, 5, precision: 2) }

      describe '#right?' do
        it 'should be false' do
          expect(subject.right?).to eq(false)
        end
      end

      describe '#oblique?' do
        it 'should be true' do
          expect(subject.oblique?).to eq(true)
        end
      end

      describe '#obtuse?' do
        it 'should be false' do
          expect(subject.obtuse?).to eq(false)
        end
      end

      describe '#acute?' do
        it 'should be true' do
          expect(subject.acute?).to eq(true)
        end
      end

      describe '#scalene?' do
        it 'should be false' do
          expect(subject.scalene?).to eq(false)
        end
      end

      describe '#equilateral?' do
        it 'should be true' do
          expect(subject.equilateral?).to eq(true)
        end
      end

      describe '#isosceles?' do
        it 'should be false' do
          expect(subject.isosceles?).to eq(false)
        end
      end

      describe '#area' do
        it 'should be 10.83' do
          expect(subject.area).to eq(10.83)
        end
      end

      describe '#perimeter' do
        it 'should be 15.0' do
          expect(subject.perimeter).to eq(15.0)
        end
      end

      describe '#semiperimeter' do
        it 'should be 7.5' do
          expect(subject.semiperimeter).to eq(7.5)
        end
      end

      describe '#inradius' do
        it 'should be 1.44' do
          expect(subject.inradius).to eq(1.44)
        end
      end

      describe '#angle_a' do
        it 'should be 60.0 degrees' do
          expect(subject.angle_a.degrees).to eq(60.0)
        end

        it 'should be 1.05 radians' do
          expect(subject.angle_a.radians).to eq(1.05)
        end
      end

      describe '#angle_b' do
        it 'should be 60.0 degrees' do
          expect(subject.angle_b.degrees).to eq(60.0)
        end

        it 'should be 1.05 radians' do
          expect(subject.angle_b.radians).to eq(1.05)
        end
      end

      describe '#angle_c' do
        it 'should be 60.0 degrees' do
          expect(subject.angle_c.degrees).to eq(60.0)
        end

        it 'should be 1.05 radians' do
          expect(subject.angle_c.radians).to eq(1.05)
        end
      end

      describe '#side_a' do
        it 'should have a length of 5.0' do
          expect(subject.side_a.length).to eq(5.0)
        end

        it 'should have an altitude of 4.33' do
          expect(subject.side_a.altitude).to eq(4.33)
        end
      end

      describe '#side_b' do
        it 'should have a length of 5.0' do
          expect(subject.side_b.length).to eq(5.0)
        end

        it 'should have an altitude of 4.33' do
          expect(subject.side_b.altitude).to eq(4.33)
        end
      end

      describe '#side_c' do
        it 'should have a length of 5.0' do
          expect(subject.side_c.length).to eq(5.0)
        end

        it 'should have an altitude of 4.33' do
          expect(subject.side_c.altitude).to eq(4.33)
        end
      end

      describe '#congruent?' do
        it 'should be congruent with a 5.0,5.0,5.0 triangle' do
          t = ShapeUp::Shapes::Triangle.new(5.0, 5.0, 5.0, precision: 2)
          expect(subject.congruent?(t)).to eq(true)
        end

        it 'should not be congruent with a 3,6,7 triangle' do
          t = ShapeUp::Shapes::Triangle.new(3, 6, 7, precision: 2)
          expect(subject.congruent?(t)).to eq(false)
        end
      end

      describe '#similar?' do
        it 'should be similar to a 8,8,8 triangle' do
          t = ShapeUp::Shapes::Triangle.new(8, 8, 8, precision: 2)
          expect(subject.similar?(t)).to eq(true)
        end

        it 'should not be similar to a 3,6,7 triangle' do
          t = ShapeUp::Shapes::Triangle.new(3, 6, 7, precision: 2)
          expect(subject.similar?(t)).to eq(false)
        end
      end

      describe '#bisect_on_angle' do
        it 'should produce an ∠C bisector length of 4.33' do
          expect(subject.bisect_on_angle(:c).first.side_c.length).to eq(4.33)
        end
      end
    end

    context 'with a 2,40,41 triangle' do
      subject { ShapeUp::Shapes::Triangle.new(2, 40, 41, precision: 2) }

      describe '#right?' do
        it 'should be false' do
          expect(subject.right?).to eq(false)
        end
      end

      describe '#oblique?' do
        it 'should be true' do
          expect(subject.oblique?).to eq(true)
        end
      end

      describe '#obtuse?' do
        it 'should be true' do
          expect(subject.obtuse?).to eq(true)
        end
      end

      describe '#acute?' do
        it 'should be false' do
          expect(subject.acute?).to eq(false)
        end
      end

      describe '#scalene?' do
        it 'should be true' do
          expect(subject.scalene?).to eq(true)
        end
      end

      describe '#equilateral?' do
        it 'should be false' do
          expect(subject.equilateral?).to eq(false)
        end
      end

      describe '#isosceles?' do
        it 'should be false' do
          expect(subject.isosceles?).to eq(false)
        end
      end

      describe '#area' do
        it 'should be 35.06' do
          expect(subject.area).to eq(35.06)
        end
      end

      describe '#perimeter' do
        it 'should be 83.0' do
          expect(subject.perimeter).to eq(83.0)
        end
      end

      describe '#semiperimeter' do
        it 'should be 41.5' do
          expect(subject.semiperimeter).to eq(41.5)
        end
      end

      describe '#inradius' do
        it 'should be 0.84' do
          expect(subject.inradius).to eq(0.84)
        end
      end

      describe '#angle_a' do
        it 'should be 2.45 degrees' do
          expect(subject.angle_a.degrees).to eq(2.45)
        end

        it 'should be 0.04 radians' do
          expect(subject.angle_a.radians).to eq(0.04)
        end
      end

      describe '#angle_b' do
        it 'should be 58.78 degrees' do
          expect(subject.angle_b.degrees).to eq(58.78)
        end

        it 'should be 1.03 radians' do
          expect(subject.angle_b.radians).to eq(1.03)
        end
      end

      describe '#angle_c' do
        it 'should be 118.77 degrees' do
          expect(subject.angle_c.degrees).to eq(118.77)
        end

        it 'should be 2.07 radians' do
          expect(subject.angle_c.radians).to eq(2.07)
        end
      end

      describe '#side_a' do
        it 'should have a length of 2.0' do
          expect(subject.side_a.length).to eq(2.0)
        end

        it 'should have an altitude of 35.06' do
          expect(subject.side_a.altitude).to eq(35.06)
        end
      end

      describe '#side_b' do
        it 'should have a length of 40.0' do
          expect(subject.side_b.length).to eq(40.0)
        end

        it 'should have an altitude of 1.75' do
          expect(subject.side_b.altitude).to eq(1.75)
        end
      end

      describe '#side_c' do
        it 'should have a length of 41.0' do
          expect(subject.side_c.length).to eq(41.0)
        end

        it 'should have an altitude of 1.71' do
          expect(subject.side_c.altitude).to eq(1.71)
        end
      end

      describe '#congruent?' do
        it 'should be congruent with a 41,2,40 triangle' do
          t = ShapeUp::Shapes::Triangle.new(41, 2, 40, precision: 2)
          expect(subject.congruent?(t)).to eq(true)
        end

        it 'should not be congruent with a 3,6,7 triangle' do
          t = ShapeUp::Shapes::Triangle.new(3, 6, 7, precision: 2)
          expect(subject.congruent?(t)).to eq(false)
        end
      end

      describe '#similar?' do
        it 'should be similar to a 3,60,61.5 triangle' do
          t = ShapeUp::Shapes::Triangle.new(3, 60, 61.5)
          expect(subject.similar?(t)).to eq(true)
        end

        it 'should not be similar to a 3,6,7 triangle' do
          t = ShapeUp::Shapes::Triangle.new(3, 6, 7)
          expect(subject.similar?(t)).to eq(false)
        end
      end

      describe '#bisect_on_angle' do
        it 'should produce an ∠C bisector length of 1.94' do
          expect(subject.bisect_on_angle(:c).first.side_c.length).to eq(1.94)
        end
      end
    end
  end
end
