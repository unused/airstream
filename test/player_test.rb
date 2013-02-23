
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
      @player.finished?.must_be true
    end
  end

  describe "when files are given" do
    it "should start playing" do
      skip
      # device = MiniTest::Mock.new
      # @player = Airstream::Player.new(device, [])
      # assert @player.finished?
    end
  end
  describe "when play a file-position that does not exist" do
    it "should raise an IndexError" do
      skip
      # @player.play(666).must_raise IndexError
    end
  end
end
