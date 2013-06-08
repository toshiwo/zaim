require 'zaim/request'
require 'zaim/user'
require 'zaim/money'
require 'zaim/category'
require 'zaim/genre'

module Zaim
  class Client
    include Zaim::Configuration
    include Zaim::Request
    include Zaim::User
    include Zaim::Money
    include Zaim::Category
    include Zaim::Genre

    def initialize options = {}
      OptionKeys.each do |attr_name|
        instance_variable_set(:"@#{ attr_name }", options[attr_name] || Zaim.instance_variable_get(:"@#{ attr_name }"))
      end
    end

  end
end
