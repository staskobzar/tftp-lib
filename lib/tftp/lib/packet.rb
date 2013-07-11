module TFTP
  module Lib
    # core TFTP packet class containing 
    # TFTP packet configuration constants
    class Packet

      # data segment size
      SEGSIZE = 512

      # optcodes for operations
      # Read request
      RRQ   = 0x01
      # Write request
      WRQ   = 0x02
      # Data
      DATA  = 0x03
      # Acknowledgment
      ACK   = 0x04
      # Error
      ERROR = 0x05

      # TFTF errors messages
      ERCODES = {
        0x00 => "Not defined, see error message (if any).",
        0x01 => "File not found.",
        0x02 => "Access violation.",
        0x03 => "Disk full or allocation exceeded.",
        0x04 => "Illegal TFTP operation.",
        0x05 => "Unknown transfer ID.",
        0x06 => "File already exists.",
        0x07 => "No such user."
      }

      # packet structure
      TFTPHDR = {
        RRQ     => "nZ*Z*",
        WRQ     => "nZ*Z*",
        DATA    => "nnZ*",
        ACK     => "n*",
        ERROR   => "nnZ*"
      }

      # TFTP read/write mode
      # should be netascii or octet
      # Case insensitive
      attr_accessor :mode

      # TFTP data or acknowlegement block number
      attr_accessor :block

      # setup TFTP Packet
      def initialize
        @mode = "netascii"
        @block = 1
      end

    end
  end
end
