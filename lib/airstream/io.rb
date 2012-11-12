
require 'io/wait'

module Airstream
  class Io
    attr_writer :quiet, :verbose
    attr_reader :key

    def print(msg)
      STDOUT.print msg unless @quiet
    end

    def puts(msg)
      STDOUT.puts msg unless @quiet
    end

    def info(msg)
      STDOUT.puts msg if @verbose
    end

    def hide_input
      `stty raw -echo`
    end

    def show_input
      `stty -raw echo`
    end

    def catch_input
      @key = nil
      if STDIN.ready?
        @key = STDIN.getc
      end
    rescue
      show_input
    end

    def quit?
      @key == "q"
    end

    def skip?
      @key == "s"
    end
  end
end
