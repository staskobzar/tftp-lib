require 'spec_helper'

module TFTP
  module Lib
    describe Packet do
      let(:packet){Packet.new}
      subject{packet}

      describe "#read" do
        let(:read_ascii){subject.read("file.txt")}
        it "creates read request packet" do
            read_ascii.unpack("n").first.should eq(Packet::RRQ)
        end
      end

    end
  end
end
