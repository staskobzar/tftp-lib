require 'tftp/lib/packet'
module TFTP
  module Lib

    # Create TFTP request packet
    # Extends TFTP::Lib::Packet
    class Request < Packet

      # creates RRQ request packet
      def read(file)
        [RRQ, file, mode].pack(TFTPHDR[RRQ])
      end

      # creates WRQ request packet
      def write(file)
        [WRQ, file, mode].pack(TFTPHDR[WRQ])
      end

      # creates DATA packet
      def data(data)
        raise DataTooLong if data.bytesize > SEGSIZE
        [DATA, block, data].pack(TFTPHDR[DATA])
      end

      # creates ACK packet
      def acknowlege
        [ACK, block].pack(TFTPHDR[ACK])
      end

      # creates ERROR packet
      def error(code)
        raise InvalidErrorCode unless ERCODES.keys.include?(code)
        [ERROR, code, ERCODES[code]].pack(TFTPHDR[ERROR])
      end

    end
  end
end
