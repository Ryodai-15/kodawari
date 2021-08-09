class Recipe < ApplicationRecord
  
  attachment :image
  
  belongs_to :member
  belongs_to :product
  
end
