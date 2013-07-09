require "tftp/lib/version"
require "tftp/lib/packet"
require "tftp/lib/request"

module TFTP
  module Lib
    class DataTooLong < ArgumentError; end
    class InvalidErrorCode < ArgumentError; end
  end
end
