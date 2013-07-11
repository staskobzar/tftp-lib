require 'spec_helper'

module TFTP
  module Lib
    describe Packet do
      describe "#new" do
        it "initiates default mode as netascii" do
          subject.mode.should eq("netascii")
        end
        it "initiates block number to 1" do
          subject.block.should be(1)
        end
      end
    end
  end
end
