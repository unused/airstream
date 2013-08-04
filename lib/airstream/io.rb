
require 'io/wait'

module Airstream
  class Io
    KEY_QUIT = 'q'
    KEY_SKIP = '>'
    KEY_PREV = '<'
    KEY_FWD  = '.'
    KEY_BACK = ','
    KEY_PAUSE = ' '

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

    def error(msg)
      STDERR.puts msg
    end

    def self.hide_input
      `stty raw -echo`
    end

    def self.show_input
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
      @key == KEY_QUIT
    end

    def skip?
      @key == KEY_SKIP
    end

    def prev?
      @key == KEY_PREV
    end

    def fwd?
      @key == KEY_FWD
    end

    def back?
      @key == KEY_BACK
    end

    def pause?
      @key == KEY_PAUSE
    end
  end
end
