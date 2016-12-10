require 'spec_helper'

describe ShapeUp::Shapes::Triangle do
  context 'with default precision', :default_precision do
    context 'attempting a 1,5,7 triangle' do
      it 'should raise an exception' do
        error = 'Invalid Triangle Sides [1, 5, 7]'
        expect { ShapeUp::Shapes::Triangle.new(1, 5, 7) }.to raise_error(error)
      end
    end

    context 'with a 3,4,5 triangle' do
      subject { ShapeUp::Shapes::Triangle.new(3, 4, 5) }

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
        it 'should be 36.8698976458 degrees' do
          expect(subject.angle_a.degrees).to eq(36.8698976458)
        end

        it 'should be 0.6435011088 radians' do
          expect(subject.angle_a.radians).to eq(0.6435011088)
        end
      end

      describe '#angle_b' do
        it 'should be 53.1301023542 degrees' do
          expect(subject.angle_b.degrees).to eq(53.1301023542)
        end

        it 'should be 0.927295218 radians' do
          expect(subject.angle_b.radians).to eq(0.927295218)
        end
      end

      describe '#angle_c' do
        it 'should be 90.0 degrees' do
          expect(subject.angle_c.degrees).to eq(90.0)
        end

        it 'should be 1.5707963268 radians' do
          expect(subject.angle_c.radians).to eq(1.5707963268)
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
          expect(subject.congruent?(ShapeUp::Shapes::Triangle.new(5.0, 3, 4))).to eq(true)
        end

        it 'should not be congruent with a 3,6,7 triangle' do
          expect(subject.congruent?(ShapeUp::Shapes::Triangle.new(3, 6, 7))).to eq(false)
        end
      end

      describe '#similar?' do
        it 'should be similar to a 15,9,12 triangle' do
          expect(subject.similar?(ShapeUp::Shapes::Triangle.new(15, 9, 12))).to eq(true)
        end

        it 'should not be similar to a 3,6,7 triangle' do
          expect(subject.similar?(ShapeUp::Shapes::Triangle.new(3, 6, 7))).to eq(false)
        end
      end

      describe '#bisect_on_angle' do
        it 'should produce an ∠C bisector length of 2.4243661069' do
          expect(subject.bisect_on_angle(:c).first.side_c.length).to eq(2.4243661069)
        end
      end
    end

    context 'with a 1,1,√2 triangle' do
      subject { ShapeUp::Shapes::Triangle.new(1, 1, Math.sqrt(2)) }

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
        it 'should be 45.0 degrees' do
          expect(subject.angle_a.degrees).to eq(45.0)
        end

        it 'should be 0.7853981634 radians' do
          expect(subject.angle_a.radians).to eq(0.7853981634)
        end
      end

      describe '#angle_b' do
        it 'should be 45.0 degrees' do
          expect(subject.angle_b.degrees).to eq(45.0)
        end

        it 'should be 0.7853981634 radians' do
          expect(subject.angle_b.radians).to eq(0.7853981634)
        end
      end

      describe '#angle_c' do
        it 'should be 90.0 degrees' do
          expect(subject.angle_c.degrees).to eq(90.0)
        end

        it 'should be 1.5707963268 radians' do
          expect(subject.angle_c.radians).to eq(1.5707963268)
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
        it 'should have a length of 1.4142135624' do
          expect(subject.side_c.length).to eq(1.4142135624)
        end

        it 'should have an altitude of 0.7071067812' do
          expect(subject.side_c.altitude).to eq(0.7071067812)
        end
      end

      describe '#congruent?' do
        it 'should be congruent with a 1,√2,1.0 triangle' do
          t = ShapeUp::Shapes::Triangle.new(1, Math.sqrt(2), 1.0)
          expect(subject.congruent?(t)).to eq(true)
        end

        it 'should not be congruent with a 3,6,7 triangle' do
          expect(subject.congruent?(ShapeUp::Shapes::Triangle.new(3, 6, 7))).to eq(false)
        end
      end

      describe '#similar?' do
        it 'should be similar to a 4,4,4√2 triangle' do
          t = ShapeUp::Shapes::Triangle.new(4, 4, 4 * Math.sqrt(2))
          expect(subject.similar?(t)).to eq(true)
        end

        it 'should not be similar to a 3,6,7 triangle' do
          expect(subject.similar?(ShapeUp::Shapes::Triangle.new(3, 6, 7))).to eq(false)
        end
      end

      describe '#bisect_on_angle' do
        it 'should produce an ∠C bisector length of 0.7071067812' do
          expect(subject.bisect_on_angle(:c).first.side_c.length).to eq(0.7071067812)
        end
      end
    end

    context 'with a 5,5,5 triangle' do
      subject { ShapeUp::Shapes::Triangle.new(5, 5, 5) }

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
        it 'should be 10.8253175473' do
          expect(subject.area).to eq(10.8253175473)
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
        it 'should be 1.443375673' do
          expect(subject.inradius).to eq(1.443375673)
        end
      end

      describe '#angle_a' do
        it 'should be 60.0 degrees' do
          expect(subject.angle_a.degrees).to eq(60.0)
        end

        it 'should be 1.0471975512 radians' do
          expect(subject.angle_a.radians).to eq(1.0471975512)
        end
      end

      describe '#angle_b' do
        it 'should be 60.0 degrees' do
          expect(subject.angle_b.degrees).to eq(60.0)
        end

        it 'should be 1.0471975512 radians' do
          expect(subject.angle_b.radians).to eq(1.0471975512)
        end
      end

      describe '#angle_c' do
        it 'should be 60.0 degrees' do
          expect(subject.angle_c.degrees).to eq(60.0)
        end

        it 'should be 1.0471975512 radians' do
          expect(subject.angle_c.radians).to eq(1.0471975512)
        end
      end

      describe '#side_a' do
        it 'should have a length of 5.0' do
          expect(subject.side_a.length).to eq(5.0)
        end

        it 'should have an altitude of 4.3301270189' do
          expect(subject.side_a.altitude).to eq(4.3301270189)
        end
      end

      describe '#side_b' do
        it 'should have a length of 5.0' do
          expect(subject.side_b.length).to eq(5.0)
        end

        it 'should have an altitude of 4.3301270189' do
          expect(subject.side_b.altitude).to eq(4.3301270189)
        end
      end

      describe '#side_c' do
        it 'should have a length of 5.0' do
          expect(subject.side_c.length).to eq(5.0)
        end

        it 'should have an altitude of 4.3301270189' do
          expect(subject.side_c.altitude).to eq(4.3301270189)
        end
      end

      describe '#congruent?' do
        it 'should be congruent with a 5.0,5.0,5.0 triangle' do
          expect(subject.congruent?(ShapeUp::Shapes::Triangle.new(5.0, 5.0, 5.0))).to eq(true)
        end

        it 'should not be congruent with a 3,6,7 triangle' do
          expect(subject.congruent?(ShapeUp::Shapes::Triangle.new(3, 6, 7))).to eq(false)
        end
      end

      describe '#similar?' do
        it 'should be similar to a 8,8,8 triangle' do
          expect(subject.similar?(ShapeUp::Shapes::Triangle.new(8, 8, 8))).to eq(true)
        end

        it 'should not be similar to a 3,6,7 triangle' do
          expect(subject.similar?(ShapeUp::Shapes::Triangle.new(3, 6, 7))).to eq(false)
        end
      end

      describe '#bisect_on_angle' do
        it 'should produce an ∠C bisector length of 4.3301270189' do
          expect(subject.bisect_on_angle(:c).first.side_c.length).to eq(4.3301270189)
        end
      end
    end

    context 'with a 2,40,41 triangle' do
      subject { ShapeUp::Shapes::Triangle.new(2, 40, 41) }

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
        it 'should be 35.0633355515' do
          expect(subject.area).to eq(35.0633355515)
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
        it 'should be 0.8448996518' do
          expect(subject.inradius).to eq(0.8448996518)
        end
      end

      describe '#angle_a' do
        it 'should be 2.4507242209 degrees' do
          expect(subject.angle_a.degrees).to eq(2.4507242209)
        end

        it 'should be 0.0427732067 radians' do
          expect(subject.angle_a.radians).to eq(0.0427732067)
        end
      end

      describe '#angle_b' do
        it 'should be 58.7822024297 degrees' do
          expect(subject.angle_b.degrees).to eq(58.7822024297)
        end

        it 'should be 1.025942974 radians' do
          expect(subject.angle_b.radians).to eq(1.025942974)
        end
      end

      describe '#angle_c' do
        it 'should be 118.7670733493 degrees' do
          expect(subject.angle_c.degrees).to eq(118.7670733493)
        end

        it 'should be 2.0728764729 radians' do
          expect(subject.angle_c.radians).to eq(2.0728764729)
        end
      end

      describe '#side_a' do
        it 'should have a length of 2.0' do
          expect(subject.side_a.length).to eq(2.0)
        end

        it 'should have an altitude of 35.0633355515' do
          expect(subject.side_a.altitude).to eq(35.0633355515)
        end
      end

      describe '#side_b' do
        it 'should have a length of 40.0' do
          expect(subject.side_b.length).to eq(40.0)
        end

        it 'should have an altitude of 1.7531667776' do
          expect(subject.side_b.altitude).to eq(1.7531667776)
        end
      end

      describe '#side_c' do
        it 'should have a length of 41.0' do
          expect(subject.side_c.length).to eq(41.0)
        end

        it 'should have an altitude of 1.7104066123' do
          expect(subject.side_c.altitude).to eq(1.7104066123)
        end
      end

      describe '#congruent?' do
        it 'should be congruent with a 41,2,40 triangle' do
          expect(subject.congruent?(ShapeUp::Shapes::Triangle.new(41, 2, 40))).to eq(true)
        end

        it 'should not be congruent with a 3,6,7 triangle' do
          expect(subject.congruent?(ShapeUp::Shapes::Triangle.new(3, 6, 7))).to eq(false)
        end
      end

      describe '#similar?' do
        it 'should be similar to a 3,60,61.5 triangle' do
          expect(subject.similar?(ShapeUp::Shapes::Triangle.new(3, 60, 61.5))).to eq(true)
        end

        it 'should not be similar to a 3,6,7 triangle' do
          expect(subject.similar?(ShapeUp::Shapes::Triangle.new(3, 6, 7))).to eq(false)
        end
      end

      describe '#bisect_on_angle' do
        it 'should produce an ∠C bisector length of 1.9401475036' do
          expect(subject.bisect_on_angle(:c).first.side_c.length).to eq(1.9401475036)
        end
      end
    end
  end
end
