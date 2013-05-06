require File.expand_path('helper/bootstrap', File.dirname(__FILE__))

describe Airstream::Player do
  before do
    @device = MiniTest::Mock.new
  end

  describe "when no files are given" do
    it "should be finished" do
      player = Airstream::Player.new(@device, [])
      assert player.finished?
    end
  end

  describe "when play a file-position that does not exist" do
    it "should raise an IndexError" do
      player = Airstream::Player.new(@device, [])
      assert_raises IndexError do
        player.play(666)
      end
    end
  end

  describe "when video files are given" do
    it "should start playing" do
      files = [Airstream::Video.new("http://example.com/video.mp4")]
      @device.expect(:send_video=, true, [Airstream::Video])
      player = Airstream::Player.new(@device, files)
      @device.verify
    end
  end

  describe "when skip is called and files are given" do
    it "should skip to next file" do
      files = [
        Airstream::Video.new("http://example.com/first.mp4"),
        Airstream::Video.new("http://example.com/second.mp4")
      ]
      @device.expect(:send_video=, true, [Airstream::Video])
      @device.expect(:send_video=, true, [Airstream::Video])
      player = Airstream::Player.new(@device, files)
      player.skip
      @device.verify
    end
  end

  describe "when skip is called and last file is given" do
    it "should be finished" do
      files = [Airstream::Video.new("http://example.com/first.mp4")]
      @device.expect(:send_video=, true, [Airstream::Video])
      player = Airstream::Player.new(@device, files)
      player.skip
      player.finished?.must_equal true
    end
  end

end

