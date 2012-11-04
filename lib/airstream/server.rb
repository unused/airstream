
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
      if File.exists?(file) && local_httpd_allowed?
        filename = Digest::MD5.hexdigest(File.basename(file, '.mp4')) + ".mp4"
        unless File.exists?(http_path + filename)
          FileUtils.cp(file, http_path + filename)
        end
        @device.send_video http_url + filename
      else
        @device.send_video file
      end
    end

    def allow_local_httpd(is_allowed)
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
      @video_duration = @video_duration || @device.scub['duration']
    end

  end
end
