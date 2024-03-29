class Calorie < ApplicationRecord
  validates :calorie, presence: true, numericality: {other_than: 0}, numericality:{only_integer: true, less_than_or_equal_to: 9999}
  validates :food, presence: true, length: {maximum: 50},format: {with:/\A[ぁ-んァ-ン一-龥]/}

  has_one_attached :image
  belongs_to :user
  has_many :messages, dependent: :destroy

  def self.search(search)
    if search != ""
      Calorie.where('food LIKE(?)', "%#{search}%")
    else
      Calorie.all.order("created_at DESC")
    end
  end
end
