
require 'rack'
require 'webrick'

module Airstream
  class Video

    @@server = nil
    attr_reader :url

    def initialize(video_file)
      @filename = video_file
      if File.exists? video_file
        @@server.server.shutdown if @@server
        @url = host_file
      else
        @url = video_file
      end
    end

    def to_s
      File.basename(@filename, File.extname(@filename))
    end

    def host_file
      @@server = Rack::Server.new(
        :server => :webrick,
        :Host => Airstream::Network.get_local_ip,
        :Port => AIRSTREAM_PORT,
        :app => Rack::File.new(@filename),
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
