
require 'optparse'
require 'airplay'
require 'ruby-progressbar'
require 'digest'
require 'fileutils'
require 'yaml'

module Airstream
  VERSION = '0.2.3'
  DEFAULT_PORT = 7000
end

require 'airstream/server.rb'
