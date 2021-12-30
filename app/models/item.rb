class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :burden
  belongs_to :area
  belongs_to :delivery_day
  has_one_attached :image

  validates :item_name,       presence: true
  validates :item_explain,    presence: true
  validates :category_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :quality_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :burden_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,         presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,           presence: true, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number', greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range'}
  # validates :user_id,         presence: true

  validates :image,           presence: true

  belongs_to :user
end
