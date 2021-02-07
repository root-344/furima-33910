class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kata, presence: true
  validates :first_name_kata, presence: true
  validates :birth, presence: true
end
