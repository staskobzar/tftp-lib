require 'spec_helper'

module TFTP
  module Lib
    describe Packet do
      describe "#new" do
        it "initiates default mode as netascii" do
          subject.mode.should eq("netascii")
        end
      end
    end
  end
end
