class Message < ApplicationRecord
  validates :message, presence: true

  belongs_to :calorie
  belongs_to :user
end
