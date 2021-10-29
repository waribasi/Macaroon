class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :gender
  has_many :calories
  has_many :messages

  validates :gender_id, numericality: { other_than: 1 } 
  validates :body_weight, format: { with: /\A[0-9]+\z/}
  validates :stature, format: { with: /\A[0-9]+\z/}
end
