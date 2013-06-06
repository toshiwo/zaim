require "zaim/version"
require 'zaim/configuration'
require 'zaim/client'

module Zaim

  class << self
    include Zaim::Configuration
  end

end
