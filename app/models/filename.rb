class Filename < ActiveRecord::Base
  attr_accessible :name, :update_type
  belongs_to :project
  has_many :fileversions

  def self.stat_file_update_type
    {
      static:  Filename.all.select { |x| x == "static" }.size ,
      dynamic: Filename.all.select { |x| x == "dynamic" }.size
    }
  end
end
