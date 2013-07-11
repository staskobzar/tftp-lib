require 'spec_helper'

module TFTP
  module Lib
    describe Response do
      let(:filename){"filename.txt"}
      let(:packdata){("Hello World"*50)[0..511]}
      let(:read){Request.new.read(filename)}
      let(:write){Request.new.write(filename)}
      let(:data){Request.new.data(packdata)}
      let(:ack){Request.new.acknowlege}
      let(:error){Request.new.error(2)}
      describe "#new" do

        it "parses RRQ packet sent via TFTP protocol" do
          res = Response.new read
          res.opcode.should be(Packet::RRQ)
        end

        it "parses filename from RRQ packet sent via TFTP protocol" do
          res = Response.new read
          res.file.should eql(filename)
        end

        it "parses mode from RRQ packet sent via TFTP protocol" do
          res = Response.new read
          res.mode.should eql("netascii")
        end

        it "parses DATA packet sent via TFTP protocol" do
          res = Response.new data
          res.opcode.should be(Packet::DATA)
        end

        it "parses block number from DATA packet sent via TFTP protocol" do
          res = Response.new data
          res.block.should be(1)
        end

        it "parses block number from DATA packet sent via TFTP protocol" do
          res = Response.new data
          res.data.should eql(packdata)
        end

        it "parses error code from ERROR packet sent via TFTP protocol" do
          res = Response.new error
          res.errcode.should be(2)
        end

        it "parses error message from ERROR packet sent via TFTP protocol" do
          res = Response.new error
          res.errmsg.should eql(Packet::ERCODES[res.errcode])
        end

        it "parses ERROR packet sent via TFTP protocol" do
          res = Response.new error
          res.opcode.should be(Packet::ERROR)
        end

        it "parses WRQ packet sent via TFTP protocol" do
          res = Response.new write
          res.opcode.should be(Packet::WRQ)
        end

        it "parses filename from WRQ packet sent via TFTP protocol" do
          res = Response.new write
          res.file.should eql(filename)
        end

        it "parses mode from WRQ packet sent via TFTP protocol" do
          res = Response.new write
          res.mode.should eql("netascii")
        end

        it "parses ACK packet sent via TFTP protocol" do
          res = Response.new ack
          res.opcode.should be(Packet::ACK)
        end

        it "parses block number from ACK packet sent via TFTP protocol" do
          res = Response.new ack
          res.block.should be(1)
        end

        it "raises IllegalTFTPop if data is empty" do
          expect{
            res = Response.new ""
          }.to raise_error(IllegalTFTPop)
        end

        it "raises IllegalTFTPop if TFTP packet is unknown" do
          expect{
            res = Response.new [69].pack("n")
          }.to raise_error(IllegalTFTPop)
        end

      end
    end
  end
end
