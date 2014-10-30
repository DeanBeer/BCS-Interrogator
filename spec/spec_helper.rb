$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'bcs_interrogator'

RSpec.configure do |config|
  config.order = :random
end

