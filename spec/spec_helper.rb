$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'brewery_control_system'

RSpec.configure do |config|
  config.order = :random
end

