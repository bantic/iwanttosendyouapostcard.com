class Destination < ActiveRecord::Base
  validates_uniqueness_of :url_name, :name
  has_many :recipients, :dependent => :destroy
  
  def to_param
    self.url_name
  end
end
