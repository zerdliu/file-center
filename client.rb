require 'rubygems'
require 'active_resource'

class Project < ActiveResource::Base
  self.site = "http://127.0.0.1:3000"
end
class Filename< ActiveResource::Base
  self.site = "http://127.0.0.1:3000"
end
class Fileversion < ActiveResource::Base
  self.site = "http://127.0.0.1:3000"
end


im = Project.new(:name => "IM").save
sf = Project.new(:name => "SF").save

50.times { |x| 
type = ['static','dynamic'].sample.to_s
filename = Filename.new(:name => "file_#{x}", :update_type => "#{type}")
filename.save
}

