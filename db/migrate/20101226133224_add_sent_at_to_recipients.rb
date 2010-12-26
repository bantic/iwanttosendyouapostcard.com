class AddSentAtToRecipients < ActiveRecord::Migration
  def self.up
    add_column :recipients, :sent_at, :timestamp
  end

  def self.down
    remove_column :recipients, :sent_at
  end
end
