class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :area, :city, :street, :building_name, :phone_number
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area,   numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :street
    validates :phone_number      
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area: area, city: city, street: street, building_name: building_name, phone_number: phone_number)
  end
end