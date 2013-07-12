module TFTP
  module Lib
    # Parses response to structure
    class Response < Packet

      # TFTP opcode
      attr_reader :opcode

      # read and parse TFTP packet
      def initialize(packet)
        self.opcode = packet.unpack("n").first
        struct = TFTPHDR[opcode]
        raise IllegalTFTPop unless struct
        self.packet = packet.unpack(struct)
      end

      # filename for RRQ and WRQ packets
      def file
        packet[1] if [RRQ, WRQ].include? opcode
      end

      # transfer mode for RRQ and WRQ packets
      def mode
        packet[2] if [RRQ, WRQ].include? opcode
      end

      # packet block number. Used by ACK and DATA packets
      def block
        packet[1] if [DATA, ACK].include? opcode
      end

      # data transfered by DATA packet
      def data
        packet[2] if [DATA, ACK].include? opcode
      end

      # error code
      def errcode
        packet[1] if opcode.eql? ERROR
      end

      # error message
      def errmsg
        packet[2] if opcode.eql? ERROR
      end

      private
        def packet #:nodoc:
          @packet
        end

        def packet=(packet) #:nodoc:
          @packet = packet
        end

        def opcode=(opcode) #:nodoc:
          @opcode = opcode
        end
    end
  end
end
