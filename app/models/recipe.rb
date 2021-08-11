class Recipe < ApplicationRecord
  
  attachment :image
  
  belongs_to :member
  belongs_to :product
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
  
end
