class Fileversion < ActiveRecord::Base
  attr_accessible :file_size, :file_version, :update_time
  belongs_to :filename
end
