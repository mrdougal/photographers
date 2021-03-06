class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|

      t.string :name
      t.string :permalink
      t.text :description

      # Paperclip columns
      t.string    :file_file_name
      t.string    :file_content_type
      t.integer   :file_file_size
      t.datetime  :file_updated_at
      
      t.timestamps
    end
    
    add_index :photos, :permalink
    
  end

  def self.down
    remove_index :photos, :permalink

    drop_table :photos
  end
end
