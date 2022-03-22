class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6}\z/i }
  validates :nickname, presence: true
  A = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :last_name, format: { with: A }, presence: true
  validates :first_name, format: { with: A }, presence: true
  B = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, format: { with: B }, presence: true
  validates :first_name_kana, format: { with: B }, presence: true
  validates :birth_day, presence: true
end
