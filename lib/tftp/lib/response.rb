module TFTP
  module Lib
    # Parses response to structure
    class Response < Packet

      # TFTP opcode
      attr_reader :opcode

      # File name
      attr_reader :file

      # transfer mode
      attr_reader :mode

      # data field
      attr_reader :data

      # error code
      attr_reader :errcode

      # error message
      attr_reader :errmsg

      # read and parse TFTP packet
      def initialize(packet)
        parse packet
      end

      private
        def parse(packet)
          self.packet = packet
          read_opcode
          read_packet
        end

        def read_opcode
          self.opcode = packet.unpack("n").first
          raise IllegalTFTPop unless TFTPHDR[opcode]
        end

        def read_packet
          data = packet.unpack(TFTPHDR[opcode])
          if [RRQ, WRQ].include? opcode
            self.file = data[1]
            self.mode = data[2]
          elsif [DATA, ACK].include? opcode
            self.block = data[1]
            self.data  = data[2] if opcode.eql? DATA
          elsif opcode.eql? ERROR
            self.errcode = data[1]
            self.errmsg  = data[2]
          end
        end

        def file=(file)
          @file = file
        end

        def mode=(mode)
          @mode = mode
        end

        def data=(data)
          @data = data
        end

        def errcode=(code)
          @errcode = code
        end

        def errmsg=(msg)
          @errmsg = msg
        end

        def packet
          @packet
        end

        def packet=(packet)
          @packet = packet
        end

        def opcode=(opcode)
          @opcode = opcode
        end
    end
  end
end
