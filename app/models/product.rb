class Product < ActiveRecord::Base
  attr_accessible :description, :price, :stock, :title, :imageUrl
  validates :price, presence: true
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }
  validates :title, presence: true, length: {minimum: 3}
  mount_uploader :imageUrl, ImageUploader  
end
