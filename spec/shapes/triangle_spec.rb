require 'spec_helper'

describe ShapeUp::Shapes::Triangle do
  context 'with default precision' do
    context 'with a 3,4,5 triangle' do
      subject { ShapeUp::Shapes::Triangle.new(3,4,5) }

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
        it 'should be of type ShapeUp::Angle' do
          expect(subject.angle_a.is_a?(ShapeUp::Angle)).to eq(true)
        end

        it 'should be 36.8698976458 degrees' do
          expect(subject.angle_a.degrees).to eq(36.8698976458)
        end

        it 'should be 0.6435011088 radians' do
          expect(subject.angle_a.radians).to eq(0.6435011088)
        end
      end

      describe '#angle_b' do
        it 'should be of type ShapeUp::Angle' do
          expect(subject.angle_b.is_a?(ShapeUp::Angle)).to eq(true)
        end

        it 'should be 53.1301023542 degrees' do
          expect(subject.angle_b.degrees).to eq(53.1301023542)
        end

        it 'should be 0.927295218 radians' do
          expect(subject.angle_b.radians).to eq(0.927295218)
        end
      end

      describe '#angle_c' do
        it 'should be of type ShapeUp::Angle' do
          expect(subject.angle_c.is_a?(ShapeUp::Angle)).to eq(true)
        end

        it 'should be 90.0 degrees' do
          expect(subject.angle_c.degrees).to eq(90.0)
        end

        it 'should be 1.5707963268 radians' do
          expect(subject.angle_c.radians).to eq(1.5707963268)
        end
      end

      describe '#side_a' do
        it 'should be of type ShapeUp::Side' do
          expect(subject.side_a.is_a?(ShapeUp::Side)).to eq(true)
        end

        it 'should have a length of 3.0' do
          expect(subject.side_a.length).to eq(3.0)
        end

        it 'should have an altitude of 4.0' do
          expect(subject.side_a.altitude).to eq(4.0)
        end
      end

      describe '#side_b' do
        it 'should be of type ShapeUp::Side' do
          expect(subject.side_b.is_a?(ShapeUp::Side)).to eq(true)
        end

        it 'should have a length of 4.0' do
          expect(subject.side_b.length).to eq(4.0)
        end

        it 'should have an altitude of 3.0' do
          expect(subject.side_b.altitude).to eq(3.0)
        end
      end

      describe '#side_c' do
        it 'should be of type ShapeUp::Side' do
          expect(subject.side_c.is_a?(ShapeUp::Side)).to eq(true)
        end

        it 'should have a length of 5.0' do
          expect(subject.side_c.length).to eq(5.0)
        end

        it 'should have an altitude of 2.4' do
          expect(subject.side_c.altitude).to eq(2.4)
        end
      end

      describe '#congruent?' do
        it 'should be congruent with a 5.0,3,4 triangle' do
          expect(subject.congruent? ShapeUp::Shapes::Triangle.new(5.0,3,4)).to eq(true)
        end
      end

      describe '#similar?' do
        it 'should be similar to a 15,9,12 triangle' do
          expect(subject.similar? ShapeUp::Shapes::Triangle.new(15,9,12)).to eq(true)
        end
      end

      describe '#bisect_on_angle' do
        it 'should produce an ∠C bisector length of 2.4243661069' do
          expect(subject.bisect_on_angle(:c).first.side_c.length).to eq(2.4243661069)
        end
      end
    end

    context 'with a 1,1,√2 triangle' do
      subject { ShapeUp::Shapes::Triangle.new(1,1,Math.sqrt(2)) }

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
        it 'should be 0.2928932188' do
          expect(subject.inradius).to eq(0.2928932188)
        end
      end

      describe '#angle_a' do
        it 'should be of type ShapeUp::Angle' do
          expect(subject.angle_a.is_a?(ShapeUp::Angle)).to eq(true)
        end

        it 'should be 45.0 degrees' do
          expect(subject.angle_a.degrees).to eq(45.0)
        end

        it 'should be 0.7853981634 radians' do
          expect(subject.angle_a.radians).to eq(0.7853981634)
        end
      end

      describe '#angle_b' do
        it 'should be of type ShapeUp::Angle' do
          expect(subject.angle_b.is_a?(ShapeUp::Angle)).to eq(true)
        end

        it 'should be 45.0 degrees' do
          expect(subject.angle_b.degrees).to eq(45.0)
        end

        it 'should be 0.7853981634 radians' do
          expect(subject.angle_b.radians).to eq(0.7853981634)
        end
      end

      describe '#angle_c' do
        it 'should be of type ShapeUp::Angle' do
          expect(subject.angle_c.is_a?(ShapeUp::Angle)).to eq(true)
        end

        it 'should be 90.0 degrees' do
          expect(subject.angle_c.degrees).to eq(90.0)
        end

        it 'should be 1.5707963268 radians' do
          expect(subject.angle_c.radians).to eq(1.5707963268)
        end
      end

      describe '#side_a' do
        it 'should be of type ShapeUp::Side' do
          expect(subject.side_a.is_a?(ShapeUp::Side)).to eq(true)
        end

        it 'should have a length of 1.0' do
          expect(subject.side_a.length).to eq(1.0)
        end

        it 'should have an altitude of 1.0' do
          expect(subject.side_a.altitude).to eq(1.0)
        end
      end

      describe '#side_b' do
        it 'should be of type ShapeUp::Side' do
          expect(subject.side_b.is_a?(ShapeUp::Side)).to eq(true)
        end

        it 'should have a length of 1.0' do
          expect(subject.side_b.length).to eq(1.0)
        end

        it 'should have an altitude of 1.0' do
          expect(subject.side_b.altitude).to eq(1.0)
        end
      end

      describe '#side_c' do
        it 'should be of type ShapeUp::Side' do
          expect(subject.side_c.is_a?(ShapeUp::Side)).to eq(true)
        end

        it 'should have a length of 1.4142135624' do
          expect(subject.side_c.length).to eq(1.4142135624)
        end

        it 'should have an altitude of 0.7071067812' do
          expect(subject.side_c.altitude).to eq(0.7071067812)
        end
      end

      describe '#congruent?' do
        it 'should be congruent with a 1,√2,1.0 triangle' do
          expect(subject.congruent? ShapeUp::Shapes::Triangle.new(1,Math.sqrt(2),1.0)).to eq(true)
        end
      end

      describe '#similar?' do
        it 'should be similar to a 4,4,4√2 triangle' do
          expect(subject.similar? ShapeUp::Shapes::Triangle.new(4,4,4*Math.sqrt(2))).to eq(true)
        end
      end

      describe '#bisect_on_angle' do
        it 'should produce an ∠C bisector length of 0.7071067812' do
          expect(subject.bisect_on_angle(:c).first.side_c.length).to eq(0.7071067812)
        end
      end
    end
  end
end
