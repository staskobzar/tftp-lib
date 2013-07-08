module TFTP
  module Lib
    class Packet

      # optcodes for operations
      RRQ   = 0x01 # Read request
      WRQ   = 0x02 # Write request
      DATA  = 0x03 # Data
      ACK   = 0x04 # Acknowledgment
      ERROR = 0x05 # Error


      attr_accessor :mode

      def initialize
        @mode = "netascii"
      end

      def read(file)
        [RRQ, file, mode].pack("nZ*Z*")
      end

    end
  end
end
