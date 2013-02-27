
require 'airstream'
require 'minitest/autorun'

class AirstreamPlayer < MiniTest::Unit::TestCase
  def setup
    # @player = Airstream::Player.new(device, files)
  end

end

require 'minitest/spec'

describe Airstream::Player do
  describe "when no files are given" do
    it "should be finished" do
      device = MiniTest::Mock.new
      @player = Airstream::Player.new(device, [])
      assert @player.finished?
    end
  end

  describe "when play a file-position that does not exist" do
    it "should raise an IndexError" do
      device = MiniTest::Mock.new
      @player = Airstream::Player.new(device, [])
      assert_raises IndexError do
        @player.play(666)
      end
    end
  end

  describe "when files are given" do
    it "should start playing" do
      skip
    end
  end

  describe "when skip is called and files are given" do
    it "should skip to next file" do
      skip
    end
  end

  describe "when skip is called and last file is given" do
    it "should be finished" do
      skip
    end
  end

end

