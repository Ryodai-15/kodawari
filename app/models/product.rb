class Product < ApplicationRecord
  
  attachment :image
  has_many :products, dependent: :destroy
  
end
