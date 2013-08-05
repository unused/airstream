module Airstream
  class Player

    SEEK_SECONDS = 30

    def initialize(device, files)
      @device, @files = device, files
      play unless @files.empty?
    end

    def play(index=0)
      unless @files.fetch(index, false)
        err_msg = "no file found at index #{index}"
        raise IndexError, err_msg
      end
      @file_index = index
      self.current_file = @files[@file_index]
    end

    def current_file=(file)
      # OPTIMIZE check if file exists (local, remote)
      @device.file = file
    end
    private :current_file=

    # TODO register commands instead of switch known
    def update(io)
      if io.quit?
        Airstream::Io.show_input ; @finished = true
      elsif io.skip? || duration <= elapsed_time
        self.next
      elsif io.prev?
        self.prev
      elsif io.fwd?
        self.seek(elapsed_time + SEEK_SECONDS)
      elsif io.back?
        self.seek(elapsed_time - SEEK_SECONDS)
      elsif io.pause?
        @pause ||= false
        (@pause = !@pause) ? @device.pause : @device.resume
      end
    end

    def seek(seconds)
      if seconds.between? 0, duration
        @device.scrub(seconds)
      end
    end

    def next
      @file_index += 1
      if @file_index < @files.size
        self.current_file = @files[@file_index]
      else
        @finished = true
      end
    end

    def prev
      if @file_index == 0
        self.seek(0)
      elsif @files.size > @file_index
        @file_index -= 1
        self.current_file = @files[@file_index]
      end
    end

    def finished?
      @finished || true
    end

    def loading?
      elapsed_time == 0
    end

    def elapsed_time
      @device.scrub[:position]
    end

    def duration
      @device.scrub[:duration]
    end
  end
end
