class Destination < ActiveRecord::Base
  validates_uniqueness_of :url_name, :name
  has_many :recipients, :dependent => :destroy
  
  EXAMPLE_ADDRESSES = [
    "10 Downing Street\nLondon",
    "222 West 23rd\nNY, NY",
    "1 West 72nd St\nNY, NY",
    "221B Baker St\nLondon",
    "350 5th Ave\nNY, NY",
    "1600 Pennsylvania Ave\nWashington, DC",
    "99 Rue de Rivoli\nParis"
  ]
  
  EXAMPLE_TEXT = [
    "I'm having a great time. Today I went snorkeling and saw an octopus.",
    "I'm dreaming of a white (sand) Christmas.",
    "This place is cool. There are literally coconuts everywhere.",
    "I went to the beach and a mongoose stole my lunch.",
    "I was sneak-attacked by an iguana."
  ]
  
  def to_param
    self.url_name
  end
  
  def postcard_image
    images = Dir[Rails.root.join("public","images","st-john","*")]
    filename = images[ rand(images.size) ].split("/").last
    "/images/st-john/#{filename}"
  end
  
  def example_address
    EXAMPLE_ADDRESSES[ rand(EXAMPLE_ADDRESSES.size) ]
  end
  
  def example_text
    EXAMPLE_TEXT[ rand(EXAMPLE_TEXT.size) ]
  end
end
