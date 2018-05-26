class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  
  validates :item_type, presence: true
  validates :shop_type, presence: true
  validates :shop_size, presence: true

  

end
