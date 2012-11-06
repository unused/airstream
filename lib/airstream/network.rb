
require 'socket'

module Airstream
  class Network
    # http://stackoverflow.com/questions/5029427/ruby-get-local-ip-nix
    def self.get_local_ip
      Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
    end
  end
end
