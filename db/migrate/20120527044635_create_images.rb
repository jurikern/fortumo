class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer  :user_id,   :null => false
      t.string   :photo_file_name, :null => false, :default => ""
      t.string   :photo_content_type, :null => false, :default => ""
      t.integer  :photo_file_size, :null => false, :default => 0

      t.timestamps
    end
    
    add_index :images, [:user_id, :photo_file_name], :unique => true
  end
end
