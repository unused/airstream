require 'simplecov'
SimpleCov.start do
  add_filter 'test'
end

require File.expand_path('../../lib/airstream.rb', File.dirname(__FILE__))

require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
# require 'pry-rescue/minitest'
