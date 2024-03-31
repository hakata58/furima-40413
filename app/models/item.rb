class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery
  belongs_to :prefectures
  belongs_to :day


  has_one_attached :image
  




  validates :image, presence: true
  validates :items_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :situation_id, numericality: { other_than: 1 } 
  validates :delivery_id, numericality: { other_than: 1 } 
  validates :prefectures_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/, message: "は半角数値のみで入力してください" }
end
