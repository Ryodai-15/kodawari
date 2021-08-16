class Review < ApplicationRecord
  
  belongs_to :member
  belongs_to :recipe
  
  validates :score, presence: true
  
end
