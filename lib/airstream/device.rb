
module Airstream

  class Device

    attr_reader :player, :video_title

    def initialize(reciever)
      @reciever = reciever
    end

    def file=(file)
      if file.class == Video
        self.video = file
      # when
        # TODO Image then self.image = file
      else
        raise "Unkown file type send to device"
      end
    end

    def image=(image_file)
      @reciever.send_image image_file
    end

    def video=(video)
      @player = @reciever.send_video video.url
      @video_title = video.to_s
    end

    def scrub
      @player.scrub
    end
  end
end
