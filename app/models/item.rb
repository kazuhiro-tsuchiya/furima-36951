class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :burden
  belongs_to :area
  belongs_to :delivery_day
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :item_explain
    validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
    validates :quality_id,       numericality: { other_than: 1, message: "can't be blank" }
    validates :burden_id,        numericality: { other_than: 1, message: "can't be blank" }
    validates :area_id,          numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_day_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :price,
              numericality: { with: /\A[0-9]+\z/, message: 'Half-width number', greater_than_or_equal_to: 300,
                              less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates :image
  end

  belongs_to :user
  has_one :purchase
end
