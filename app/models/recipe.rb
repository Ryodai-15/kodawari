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
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end

end
