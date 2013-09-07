require 'rubygems'
require 'active_resource'

class Project < ActiveResource::Base
  self.site = "http://127.0.0.1:3000"
end

puts Random.rand(5000)
