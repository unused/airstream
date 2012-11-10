
module Airstream
  class Io
    attr_writer :quiet, :verbose

    def print(msg)
      STDOUT.print msg unless @quiet
    end

    def puts(msg)
      STDOUT.puts msg unless @quiet
    end

    def info(msg)
      STDOUT.puts msg if @verbose
    end

  end
end
