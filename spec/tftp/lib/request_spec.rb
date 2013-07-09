require 'spec_helper'

module TFTP
  module Lib
    describe Request do
      let(:packet){Request.new}
      let(:filename){"file.txt"}
      subject{packet}

      describe "#read" do
        let(:read_ascii){subject.read(filename)}

        it "creates read ascii request packet" do
            read_ascii.unpack("n").first.should eq(1)
        end

        it "creates read request which contains filename" do
          read_ascii.unpack("nZ*")[1].should eq(filename)
        end

        it "creates read ascii request" do
          read_ascii.unpack("nZ*Z*")[2].should eq("netascii")
        end

      end

      describe "#write" do
        let(:write_ascii){subject.write(filename)}

        it "creates write ascii request packet" do
          write_ascii.unpack("n").first.should eq(2)
          write_ascii.unpack("nZ*Z*")[2].should eq("netascii")
        end

        it "creates write ascii request for filename in packet" do
          write_ascii.unpack("nZ*Z*")[1].should eq(filename)
        end
      end

      describe "#data" do
        it "creates data ascii packet" do
          data = "helloworld"
          subject.data(data).unpack("n").first.should eq(3)
        end

        it "raises DataTooLong if data is too long" do
          data = "a"*513
          expect{
            subject.data(data)
          }.to raise_error(DataTooLong)
        end
      end

      describe "#acknowlege" do
        it "create acknowlegement packet" do
          subject.acknowlege.unpack("n*").first.should be(4)
        end
      end

      describe "#error" do
        let(:error){ subject.error(1).unpack("nnZ*") }

        it "creates ERROR packet" do
          error[0].should be(5)
        end

        it "creates ERROR with one of the 0-7 codes" do
          error[1].should be(1)
        end

        it "ERROR packet contains error description" do
          error[2].should eql("File not found.")
        end

        it "raises InvalidErrorCode" do
          expect{ 
            subject.error(556677)
          }.to raise_error(InvalidErrorCode)
        end

      end

    end
  end
end
