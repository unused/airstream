
module Airstream
  class Node < Airplay::Client

    def initialize(reciever)
      node = Airplay::Server::Node.new(
        reciever, reciever, reciever, AIRPLAY_PORT)
      super node
      use node # does not work without that second assign
    end

  end
end
