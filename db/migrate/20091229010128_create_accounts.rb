class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      
      t.string :name
      t.string :subdomain
      t.string :email
      t.string :phone

      t.timestamps
    end
    
    add_index :accounts, :subdomain
    
  end

  def self.down
    remove_index :accounts, :subdomain
    drop_table :accounts
  end
end
