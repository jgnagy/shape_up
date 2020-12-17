# frozen_string_literal: true

require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter
]
SimpleCov.start { add_filter '/spec/' }

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'shape_up'
