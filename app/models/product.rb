class Product < ApplicationRecord

  attachment :image
  has_many :recipes, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true
  validates :kodawari, presence: true

end
