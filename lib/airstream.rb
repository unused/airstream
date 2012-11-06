
require 'optparse'
require 'airplay'
require 'ruby-progressbar'
require 'yaml'
require 'rack'

module Airstream
  DEFAULT_PORT = 7000
end

require 'airstream/version.rb'
require 'airstream/network.rb'
require 'airstream/video.rb'
require 'airstream/server.rb'
