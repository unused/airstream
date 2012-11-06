
require 'minitest/autorun'

class TestAirstreamServer < MiniTest::Unit::TestCase

  def setup
    # @TODO stub airstream device
    # @server = Airstream::Server.new @device_stub
  end

  def test_send_image
    image_file = '~/lolcat.png'
    @server.image image_file
    @device_stub.image.must_equal image_file
  end

end
