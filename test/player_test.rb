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
      @device.expect(:file=, true, [files[0]])
      player = Airstream::Player.new(@device, files)
      @device.verify
    end
  end

  describe "when next is called and files are given" do
    it "should next to next file" do
      files = [
        Airstream::Video.new("http://example.com/first.mp4"),
        Airstream::Video.new("http://example.com/second.mp4")
      ]
      @device.expect(:file=, true, [files[0]])
      @device.expect(:file=, true, [files[1]])
      player = Airstream::Player.new(@device, files)
      player.next
      @device.verify
    end
  end

  describe "when next is called and last file is given" do
    it "should be finished" do
      files = [Airstream::Video.new("http://example.com/first.mp4")]
      @device.expect(:file=, true, [files[0]])
      player = Airstream::Player.new(@device, files)
      player.next
      @device.verify ; player.finished?.must_equal true
    end
  end

  describe "when prev is called" do
    it "should be switch back to previous file" do
      files = [
        Airstream::Video.new("http://example.com/first.mp4"),
        Airstream::Video.new("http://example.com/second.mp4")
      ]
      @device.expect(:file=, true, [files[0]])
      @device.expect(:file=, true, [files[1]])
      @device.expect(:file=, true, [files[0]])
      player = Airstream::Player.new(@device, files)
      player.next
      player.prev
      @device.verify ; player.finished?.must_equal true
    end
  end

  describe "when prev is called on first file" do
    it "should start from beginning" do
      files = [Airstream::Video.new("http://example.com/first.mp4")]
      @device.expect(:file=, true, [files[0]])
      @device.expect(:duration, 25)
      @device.expect(:scrub, true, [0])
      player = Airstream::Player.new(@device, files)
      player.prev
      @device.verify
    end
  end

  describe "when a file is file= to the device" do
    it "the player should be loading" do
      files = [Airstream::Video.new("http://example.com/first.mp4")]
      @device.expect(:file=, true, [files[0]])
      @device.expect(:position, 0)
      @device.expect(:position, 1)
      @device.expect(:position, 45)
      player = Airstream::Player.new(@device, files)
      player.loading?.must_equal true
      player.loading?.must_equal false
      player.loading?.must_equal false
      @device.verify
    end
  end

  # OPTIMIZE find better way to handle IO Mock
  describe "when the player is paused" do
    it "should either file= pause or resume" do
      player = Airstream::Player.new(@device, [])
      io = MiniTest::Mock.new
      5.times do
        [:quit?, :skip?, :prev?, :fwd?, :back?].each do |cmd|
          io.expect(cmd, false)
        end
        @device.expect(:duration, 90)
        @device.expect(:position, 1)
        io.expect(:pause?, true)
        @device.expect(:pause, true)
        player.update io
        [:quit?, :skip?, :prev?, :fwd?, :back?].each do |cmd|
          io.expect(cmd, false)
        end
        io.expect(:pause?, true)
        @device.expect(:duration, 90)
        @device.expect(:position, 1)
        @device.expect(:resume, true)
        player.update io
      end
      @device.verify
      io.verify
    end
  end
end
