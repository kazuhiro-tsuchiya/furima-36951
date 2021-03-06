class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :area_id, :city, :street, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id,   numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone_number,
              format: { with: /\A0[5789]0\d{4}\d{4}\z|\A0\d{2}\d{3}\d{4}\z/, message: 'is invalid. Input only number' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, street: street, building_name: building_name,
                   phone_number: phone_number, purchase_id: purchase.id)
  end
end
