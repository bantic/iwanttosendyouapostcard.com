class Recipient < ActiveRecord::Base
  belongs_to :destination
  
  validates_presence_of :name, :address, :destination
  validates_uniqueness_of :name
end
