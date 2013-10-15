class Product < ActiveRecord::Base
  attr_accessible :description, :price, :stock, :title, :imageUrl, :category

  belongs_to :user

  validates :price, presence: true
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }
  validates_numericality_of :price, :greater_than => 0
  validates_numericality_of :stock, :greater_than => -1
  validates :title, presence: true, length: {minimum: 3}

  mount_uploader :imageUrl, ImageUploader  

  validates_inclusion_of :category, :in => ['electronics', 'book', 'home']

  def category
    read_attribute(:category)
  end
  def category= (value)
    write_attribute(:category, value)
  end

  letsrate_rateable "product_id"
end
