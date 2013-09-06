class CreateFilenames < ActiveRecord::Migration
  def change
    create_table :filenames do |t|
      t.string :name
      t.string :update_type
      t.integer :project_id

      t.timestamps
    end
  end
end
