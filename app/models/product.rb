class Product < ApplicationRecord

  attachment :image
  has_many :recipes, dependent: :destroy

end
