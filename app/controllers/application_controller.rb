class ApplicationController < ActionController::Base
  protect_from_forgery

  def self.import_db_data(db_path = File.join(Rails.root, 'db/pull_data'))
    require 'yaml'
    Project.new(:name => 'IM').save
    project = Project.find 1
    %w[dynamic static].each do |update_type|
      meta_datas = YAML.load(File.read(File.join(db_path, update_type)))
      meta_datas.each do |k, meta_data|
        filename = meta_data['Name']
        file_version = meta_data['Version']
        update_time = meta_data['Time]']
        file_size = meta_data['Size']
        download_times = rand(10000)

        update_db(project, filename, file_version, file_size,
                    update_type, update_time, download_times)

        puts "#{update_type} #{filename} #{file_version}"
      end
    end
  end

  protected
  def self.update_db(project, filename, file_version, file_size,
                update_type, update_time, download_times)

    filename_m = Filename.where(:project_id => project.id,
                                :name => filename,
                                :update_type => update_type)
    if filename_m.empty?
      filename_m = Filename.new(:name => filename,
                                :update_type => update_type)
      filename_m.save
      project.filenames << filename_m
    else
      filename_m = filename_m.first
    end

    fileversion_m = Fileversion.new(:file_size => file_size,
                                    :file_version => file_version,
                                    :update_time => update_time,
                                    :download_times => download_times)
    fileversion_m.save

    filename_m.fileversions << fileversion_m
  end
end
