class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
      t.string :name
      t.string :image_path
      t.string :url_name

      t.timestamps
    end
  end

  def self.down
    drop_table :destinations
  end
end
