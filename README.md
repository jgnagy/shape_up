# ShapeUp

A Pure-Ruby library for interacting with shapes. So far, only triangles are supported, but maybe more will come later.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shape_up'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shape_up

## Usage

There will eventually be a simple command-line utility useful for very basic operations, but for now the library can only be used in `irb` or in some other Ruby code.

To get started with the ShapeUp shapes library do the following:

```ruby
require 'shape_up'
```

This isn't strictly required, but it makes working with shapes a whole lot easier:

```ruby
include ShapeUp::Shapes
```

From here, the Triangle class provides most of the useful capabilities of this library:

```ruby
triangle = Triangle.new(3, 4, 5)
triangle.right?           # => true
triangle.oblique?         # => false
triangle.obtuse?          # => false
triangle.acute?           # => false
triangle.scalene?         # => true
triangle.equilateral?     # => false
triangle.isosceles?       # => false
triangle.angle_a          # => #<ShapeUp::Angle:0x007f8ce2025f5...
triangle.angle_a.degrees  # => 36.8698976458
triangle.angle_a.radians  # => 0.6435011088
triangle.side_c           # => #<ShapeUp::Side:0x009e6fe21354d...
triangle.side_c.length    # => 5
triangle.side_c.altitude  # => 2.4
triangle.area             # => 6.0
triangle.perimeter        # => 12
triangle.semiperimeter    # => 6
triangle.inradius         # => 1.0
```

Triangle values default to a precision of 10 decimal places, though this can be overridden, even on an existing Triangle:

```ruby
# Change an existing Triangle's precision
less_precise = triangle.to_precision(6)
less_precise.angle_a.degrees # => 36.869898
more_precise = triangle.to_precision(12)
more_precise.angle_a.degrees # => 36.869897645844

# Set a Triangle's precision on creation
#  Note that _more_ precision can lead to unusual rounding errors
special_right = Triangle.new(1, 1, Math.sqrt(2), precision: 13)
special_right.side_c.length  # => 1.4142135623731
```

Triangles can also be split by bisecting an angle by its label:

```ruby
triangle.angle_c.degrees                # => 90.0
abd, acd = triangle.bisect_on_angle(:c)
abd.area                                # => 2.5714285714
acd.area                                # => 3.4285714286
triangle.area == (abd.area + acd.area)  # => true
abd.angle_a.degrees                     # => 45.0
# This is the length of the bisector
abd.side_c.length                       # => 2.4243661069
acd.side_c.length                       # => 2.4243661069
```

Triangles can also be compared:

```ruby
other = Triangle.new(9, 12, 15)
triangle.similar? other   # => true
triangle.congruent? other # => false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jgnagy/shape_up.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

