class Product < ActiveRecord::Base
  attr_accessible :Description, :Image, :Price, :Stock, :Title
end
