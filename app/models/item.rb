class Item < ApplicationRecord
  has_one_attached :image

  validates :item_name,       presence: true
  validates :item_explain,    presence: true
  validates :category_id,     presence: true
  validates :quality_id,      presence: true
  validates :burden_id,       presence: true
  validates :area_id,         presence: true
  validates :delivery_day_id, presence: true
  validates :price,           presence: true
  validates :user_id,         presence: true

  validates :image,           presence: true
end
