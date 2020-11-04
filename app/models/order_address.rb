class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id,:item_id, :postal_code, :prefectures_id, :municipality, :address, :building_name, :tell_phone, :purchase_id
  # クレカトークンはテーブルには保存しないのでカラム名以外で保存する

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :tell_phone
  end

  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
  validates :tell_phone, format: { with: /\A\d{10,11}\z/}
  
  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, tell_phone: tell_phone, purchase_id: purchase_id, user_id: user_id)
  end
end


# order_address = OrderAddress.new(order_params)
# order_address.save