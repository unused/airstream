
module Airstream
  class Server < Airplay::Client
    attr_accessor :http_path, :http_url, :video_duration

    @local_httpd_allowed = false

    def initialize(reciever)
      node = Airplay::Server::Node.new(
        reciever, reciever, reciever, Airstream::DEFAULT_PORT)
      @device = Airplay::Client.new(node)
      @device.use(node) # does not work without that second assign
    end

    def image=(image_file)
      @device.send_image image_file
    end

    def video=(video_file)
      video_duration = nil
      video = Video.new(video_file)
      @device.send_video(video.url)
    end

    def allow_local_httpd=(is_allowed)
      @local_httpd_allowed = is_allowed
    end

    def local_httpd_allowed?
      @local_httpd_allowed
    end

    def loading?
      @device.scrub['position'] == 0
    end

    def video_position
      @device.scrub['position']
    end

    def video_duration
      @video_duration = @video_duration || @device.scrub['duration']
    end

  end
end
