class CreateFileversions < ActiveRecord::Migration
  def change
    create_table :fileversions do |t|
      t.integer :file_size
      t.integer :file_version
      t.time :update_time
      t.integer :filename_id

      t.timestamps
    end
  end
end
