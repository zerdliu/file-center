class Filename < ActiveRecord::Base
  attr_accessible :name, :update_type
  belongs_to :project
  has_many :fileversions

  def self.stat_file_update_type
    [
      {label: "static", value: Filename.all.select { |x| x.update_type == "static" }.size },
      {label: "dynamic",value: Filename.all.select { |x| x.update_type == "dynamic" }.size},
    ]
  end
end
