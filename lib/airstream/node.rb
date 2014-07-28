
module Airstream
  class Node < Airplay::Client

    def initialize(receiver)
      node = Airplay::Server::Node.new(
        receiver, receiver, receiver, AIRPLAY_PORT)
      super node
      # TODO test if does not work without
      use node # does not work without that second assign
    end

  end
end
