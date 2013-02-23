
require 'optparse'
require 'airplay'
require 'ruby-progressbar'
require 'yaml'
require 'rack'

module Airstream
  AIRPLAY_PORT = 7000
  AIRSTREAM_PORT = 7000
end

require 'airstream/version.rb'
require 'airstream/io.rb'
require 'airstream/network.rb'
require 'airstream/node.rb'
require 'airstream/player.rb'
require 'airstream/video.rb'
require 'airstream/device.rb'
