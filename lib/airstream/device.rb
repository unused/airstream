
module Airstream
  # pbar = ProgressBar.create(pbar_options)
  # while (elapsed_time=server.video_position) < server.video_duration
  #   io.catch_input
  #   break if io.quit? || io.skip?
  #   pbar.progress = elapsed_time
  #   formatted_time = Time.at(elapsed_time).gmtime.strftime('%R:%S')
  #   pbar.title = "#{video_title} #{formatted_time}"
  #   sleep 0.5
  # end
  # io.show_input
  # pbar.finish
  class Device

    @local_httpd_allowed = false
    @current_file_index

    def initialize(reciever, files)
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

    def update(io)
      elapsed_time = video_position
      formatted_time = Time.at(elapsed_time).gmtime.strftime('%R:%S')
      @pbar.title = "#{@video_title} #{formatted_time}"
      if io.quit?
        Airstream::Io.show_input
        exit # TODO skip to last fil, no exit
      elsif io.skip? || video_duration <= elapsed_time
        @current_file_index += 1
        self.video = @video_files[@current_file_index] if @video_files.count > @current_file_index
      elsif io.prev?
        if @current_file_index == 0
          @reciever.scrub(0)
        else
          @current_file_index -= 1
          self.video = @video_files[@current_file_index] if @video_files.count > @current_file_index
        end
      elsif io.fwd?
        @reciever.scrub(video_position + 30) if video_position + 30 < video_duration
      elsif io.back?
        @reciever.scrub(video_position - 30) if video_position - 30 > 0
      elsif io.pause?
        paused? ? @player.pause : @player.resume
      end
    end

    def finished?
      !! (@current_file_index == @video_files.count-1) && (video_position == video_duration)
    end

    def allow_local_httpd=(is_allowed)
      @local_httpd_allowed = is_allowed
    end

    def local_httpd_allowed?
      @local_httpd_allowed
    end

    def loading?
      @reciever.scrub['position'] == 0
    end

    def video_position
      @pbar.progress = @reciever.scrub['position']
    end

    def video_duration
      @video_duration = @video_duration || @reciever.scrub['duration']
    end

    def paused?
      @paused = !@paused || false
    end
  end
end
