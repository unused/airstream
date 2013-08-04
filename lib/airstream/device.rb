
module Airstream

  class Device

    attr_reader :player, :video_title

    def initialize(reciever)
      @reciever = Airstream::Node.new reciever # OPTIMIZE dependency injection, remove Node
    end

    def image=(image_file)
      @reciever.send_image image_file
    end

    def video=(video_file)
      @player = @reciever.send_video(video.url)
      @video_title = File.basename(video_file, File.extname(video_file))
    end
      # NOTE !! (@current_file_index == @video_files.count-1) && (video_duration <= elapsed_time)
  end
end
