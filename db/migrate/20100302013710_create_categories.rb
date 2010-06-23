class CreateCategories < ActiveRecord::Migration
  def self.up
    
    create_table :categories, :force => true do |t|
      t.string :name
      t.string :permalink
      
      t.timestamps
    end
    
    add_column :photos, :category_id, :integer
    add_index :categories, :permalink
    
  end

  def self.down
    remove_column :photos, :category_id
    remove_index :categories, :permalink
    drop_table :categories
  end
end
