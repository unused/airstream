
module Airstream

  class Device

    attr_reader :player, :video_title

    def initialize(reciever)
      @reciever = reciever
    end

    def send(file)
      case file.class
      when Video then self.video = file
      # TODO when Image then self.image = file
      # TODO else raise "Unkown file type send to device"
      end
    end

    def image=(image_file)
      @reciever.send_image image_file
    end

    def video=(video)
      @player = @reciever.send_video video.url
      @video_title = video.to_s
    end
  end
end
