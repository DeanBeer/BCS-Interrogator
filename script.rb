$:.push File.expand_path('../lib', __FILE__)
require 'bcs_interrogator'
bcs = NRB::BCSInterrogator.new api_args: { base_url: 'http://beta.newrepublicbrewing.com:11405' }
sysname = bcs.api.sysname
data = sysname.data
