class Fileversion < ActiveRecord::Base
  attr_accessible :file_size, :file_version, :update_time, :download_times, :filename_id
  belongs_to :filename

  def self.stat_file_download_method
    [
      {label: "p2p", value: Fileversion.all.select { |x| x.file_size <= 3500 }.size },
      {label: "ftp",value: Fileversion.all.select { |x| x.file_size >= 3500 }.size},
    ]
  end

end
