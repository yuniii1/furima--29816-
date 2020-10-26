class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :shipping
  belongs_to_active_hash :shipment_source

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end

  with_options numericality: { other_than: 1 } do
    validates :condition_id
    validates :delivery_date_id
    validates :shipping_id
    validates :shipment_source_id
    validates :category_id
  end
  validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
end
