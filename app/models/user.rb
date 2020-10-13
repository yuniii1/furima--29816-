class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, length: { maximum: 6 }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, messages: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, messages: 'is invalid. Input full-width characters.' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, messages: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, messages: 'is invalid. Input full-width katakana characters.' }
    validates :date_select
  end
  validates :email, uniqueness: true
  # validates :nickname, presence: true, length: { maximum: 6 }, :email, uniqueness: true
end
