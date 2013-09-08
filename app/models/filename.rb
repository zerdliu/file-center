class Filename < ActiveRecord::Base
  attr_accessible :name, :update_type, :project_id, :source_addr
  attr_reader :project_name, :last_version, :average_file_size, :last_file_size, :update_freq, :download_times, :update_kb, :download_kb
  belongs_to :project
  has_many :fileversions

  def project_name
    self.project.name
  end

  def last_version
    self.fileversions.last.file_version
  end

  def average_file_size
    (self.fileversions.inject(0) { |sum,x| sum + x.file_size } / self.fileversions.size).to_i
  end

  def last_file_size
    self.fileversions.last.file_size
  end

  def update_freq
    self.fileversions.last.download_times
  end

  def download_times
    self.fileversions.inject(0){ |sum, e| sum + e.download_times } 
  end

  def update_kb
    self.fileversions.inject(0){ |sum, e| sum + e.file_size }
  end

  def download_kb
    self.fileversions.inject(0){ |sum, e| sum + e.file_size * e.download_times }
  end

  def self.stat_file_update_type
    [
      {label: "static", value: Filename.all.select { |x| x.update_type == "static" }.size },
      {label: "dynamic",value: Filename.all.select { |x| x.update_type == "dynamic" }.size},
    ]
  end

end
