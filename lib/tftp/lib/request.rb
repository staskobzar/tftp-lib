module TFTP
  module Lib
    class Request < Packet

      def initialize
        super
      end

      # creates RRQ request packet
      def read(file)
        [RRQ, file, mode].pack("nZ*Z*")
      end

      # creates WRQ request packet
      def write(file)
        [WRQ, file, mode].pack("nZ*Z*")
      end

      # creates DATA packet
      def data(data)
        raise DataTooLong if data.bytesize > PACKSIZE
        [DATA, block, data].pack("nnA*")
      end

      # creates ACK packet
      def acknowlege
        [ACK, block].pack("n*")
      end

      # creates ERROR packet
      def error(code)
        raise InvalidErrorCode unless ERCODES.keys.include?(code)
        [ERROR, code, ERCODES[code]].pack("nnZ*")
      end

    end
  end
end
