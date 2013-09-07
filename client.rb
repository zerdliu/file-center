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

50.times do |x| 
  type = ['static','dynamic'].sample.to_s
  filename = Filename.new(:name => "file_#{x}", :update_type => "#{type}", :project_id => 1 )
  filename.save
end

Filename.all.each do |file|
  (1 + Random.rand(5)).times do |version| 
    
    fileversion = Fileversion.new(:file_version => version, :file_size => Random.rand(5000), :download_times => Random.rand(100), :update_time => Time.now, :filename_id => file.id)
    fileversion.save
  end
end

