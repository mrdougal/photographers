class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      
      t.string :name
      t.string :domain
      t.string :email
      t.string :phone

      t.timestamps
    end
    
    add_index :accounts, :domain
    
  end

  def self.down
    remove_index :accounts, :domain
    drop_table :accounts
  end
end
