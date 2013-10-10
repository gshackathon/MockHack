class Product < ActiveRecord::Base
  attr_accessible :Description, :ImageUrl, :Price, :Stock, :Title
end
