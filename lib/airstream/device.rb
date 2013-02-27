
module Airstream

  class Device

    @local_httpd_allowed = false
    @current_file_index

    def initialize(reciever, files=[])
      @video_files = files
      @reciever = Airstream::Node.new reciever
      @current_file_index = 0
      self.video = files.first unless files.empty?
    end

    def image=(image_file)
      @reciever.send_image image_file
    end

    def video=(video_file)
      @pbar.finish unless @pbar == nil
      @video_duration = nil
      video = Video.new(video_file)
      @player = @reciever.send_video(video.url)
      print "loading"
      while loading?
        print "."
        sleep 0.8
      end
      @pbar = ProgressBar.create({ format: '%t |%b%i| %p%%', total: video_duration })
      @video_title = File.basename(video_file, File.extname(video_file))
    end
  end
end
