require "tftp/lib/version"
require "tftp/lib/packet"
require "tftp/lib/request"

module TFTP
  module Lib
    # Error raised if data size is bigger then SEGSIZE (512 bytes)
    class DataTooLong < ArgumentError; end

    # Error raised if error packet got wrong code
    class InvalidErrorCode < ArgumentError; end

  end
end
