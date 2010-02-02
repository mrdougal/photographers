class CreatePhotoSets < ActiveRecord::Migration
  def self.up
    create_table :photo_sets do |t|

      t.string :name
      t.string :permalink
      t.text :description

      t.timestamps
    end

    add_index :photo_sets, :permalink

    add_column :photos, :photo_set_id, :integer
    
  end

  def self.down

    remove_column :photos, :photo_set_id
    remove_index :photo_sets, :permalink
    drop_table :photo_sets
  end
end
