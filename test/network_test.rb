require File.expand_path('helper/bootstrap', File.dirname(__FILE__))

class AirstreamNetwork < MiniTest::Unit::TestCase
  def test_getting_local_ip
    ip = Airstream::Network.get_local_ip
    `ifconfig`.must_match /#{ip}/
  end
end

