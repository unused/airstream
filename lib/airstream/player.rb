
module Airstream

  class Player

    def initialize(device, files=[])
      @files = files
      @device = device
      play(0) unless files.empty? # play first video file
    end

    def play(i)
      raise IndexError, "no file found at index #{i}" if @files[i].nil?
      @finished = false
      @file_index = i
      video = @files[@file_index]
      @pbar.finish unless @pbar == nil
    end

    def video=(video_file)
      @device.send_video = Video.new(video_file)
      Io.print "loading" # TODO
      while loading?
        Io.print "."
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
        exit 0 # TODO skip to last file, no real exit
      elsif io.skip? || video_duration <= elapsed_time
        @current_file_index += 1
        if @current_file_index < @video_files.length
          self.video = @video_files[@current_file_index] if @video_files.count > @current_file_index
        else
          @finished = true
        end
      elsif io.prev?
        if @current_file_index == 0
          @reciever.scrub(0)
        else
          @current_file_index -= 1
          self.video = @video_files[@current_file_index] if @video_files.count > @current_file_index
        end
      elsif io.fwd?
        @reciever.scrub(video_position + 130) if video_position + 30 < video_duration
      elsif io.back?
        @reciever.scrub(video_position - 30) if video_position - 30 > 0
      elsif io.pause?
        paused? ? @player.pause : @player.resume
      end
    end

    def finished?
      @finished || true
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
