
require 'rack'
require 'webrick'
require 'open3'

module Airstream
  class Video

    @@server = nil

    def initialize(video_file)
      begin
        stdin, stdout, stderr = Open3.popen3("youtube-dl -f best -g #{video_file}")
        output = stdout.gets
        if stderr.gets.nil? && !output.nil?
          @filename = output
        else
          @filename = video_file
        end
      rescue Exception => e
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
