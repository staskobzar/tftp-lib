module TFTP
  module Lib
    class Packet

      # packet size
      PACKSIZE = 512

      # optcodes for operations
      RRQ   = 0x01 # Read request
      WRQ   = 0x02 # Write request
      DATA  = 0x03 # Data
      ACK   = 0x04 # Acknowledgment
      ERROR = 0x05 # Error

      ERCODES = {
        0 => "Not defined, see error message (if any).",
        1 => "File not found.",
        2 => "Access violation.",
        3 => "Disk full or allocation exceeded.",
        4 => "Illegal TFTP operation.",
        5 => "Unknown transfer ID.",
        6 => "File already exists.",
        7 => "No such user."
      }
      attr_accessor :mode, :block

      def initialize
        @mode = "netascii"
        @block = 0
      end

    end
  end
end
