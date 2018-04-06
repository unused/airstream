
require 'rack'
require 'webrick'
require 'youtube-dl.rb'

module Airstream
  class Video

    @@server = nil

    def initialize(video_file)
      options = {
        skip_download: true,
        get_url: true,
        format: :best,
        continue: false,
        color: false,
        progress: false
      }
      begin
          @filename = YoutubeDL::Runner.new(video_file, options).run
      rescue  # optionally: `except Exception, ex:`
          @filename = video_file
      end
    end

    def to_s
      File.basename(@filename, File.extname(@filename))
    end

    def url
      File.exists?(@filename) ? host_file : @filename
    end

    def host_file
      @@server.server.shutdown if @@server
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
    private :host_file
  end
end
