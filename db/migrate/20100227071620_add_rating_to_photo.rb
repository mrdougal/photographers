class AddRatingToPhoto < ActiveRecord::Migration
  def self.up
    
    add_column :photos, :rating, :integer
    
  end

  def self.down
    remove_column :photos, :rating
  end
end
