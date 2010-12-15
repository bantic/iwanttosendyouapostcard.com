class CreateRecipients < ActiveRecord::Migration
  def self.up
    create_table :recipients do |t|
      t.string :name
      t.string :address
      t.string :instructions
      t.references :destination
      
      t.timestamps
    end
  end

  def self.down
    drop_table :recipients
  end
end
