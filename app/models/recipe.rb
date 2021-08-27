class Recipe < ApplicationRecord
  attachment :image

  belongs_to :member
  belongs_to :product
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true
  validates :kodawari, presence: true

  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f
    end
  end

  def review_score_percentage
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f * 100 / 5
    end
  end

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
end
