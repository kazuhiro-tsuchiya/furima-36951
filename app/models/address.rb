class Address < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id,   numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :street
    validates :phone_number      
  end
end
