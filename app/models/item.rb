class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_day
  belongs_to :prefecture

  validates :image           , presence: true
  validates :name            , presence: true
  validates :description     , presence: true
  validates :category_id     , numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id       , numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id , numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id   , numericality: { other_than: 1, message: "can't be blank" }
  validates :price           , presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
