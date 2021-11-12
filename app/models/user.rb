class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :gender
  has_many :calories
  has_many :messages

  validates :nickname, presence: true
  validates :gender_id, presence: true, numericality: { other_than: 1 } 
  validates :body_weight, presence: true, format: { with: /\A[0-9]+\z/}, numericality:{only_integer: true}
  validates :stature, presence: true, format: { with: /\A[0-9]+\z/}, numericality:{only_integer: true}
end

