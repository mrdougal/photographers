class CreateCategories < ActiveRecord::Migration
  def self.up
    
    create_table :categories, :force => true do |t|
      t.string :name
      t.timestamps
    end
    
    add_column :photos, :category_id, :integer
    add_index :categories, :name
    
  end

  def self.down
    remove_column :photos, :category_id
    remove_index :categories, :name
    drop_table :categories
  end
end
