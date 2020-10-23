class User < ApplicationRecord
  has_many :items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    VALD_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    validates :first_name, format: { with: VALD_NAME_REGEX , messages: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: VALD_NAME_REGEX , messages: 'is invalid. Input full-width characters.' }
    VALID_NAME_REGEX = /\A[ァ-ヶー－]+\z/
    validates :first_name_kana, format: { with: VALID_NAME_REGEX , messages: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_kana, format: { with: VALID_NAME_REGEX , messages: 'is invalid. Input full-width katakana characters.' }
    validates :date_select
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, messages: 'is invalid. Input half-width characters.'}
  end
end
