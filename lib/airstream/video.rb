require 'rack'
require 'webrick'

module Airstream
  class Video
    @@server = nil
    attr_reader :url
    def initialize(video_file)
      if File.exists? video_file
        @@server.stop if @@server
        @url = host_file(video_file)
      else
        @url = video_file
      end
    end

    def host_file(file)
      @@server = Rack::Server.new(
        :server => :webrick,
        :Host => Airstream::Network.get_local_ip,
        :Port => 7071,
        :app => Rack::File.new(file),
        :AccessLog => [], # stfu webrick
        :Logger => WEBrick::Log::new("/dev/null", 7)
      )
      Thread.start do
        @@server.start
      end
      "http://#{@@server.options[:Host]}:#{@@server.options[:Port]}"
    end
  end
end
