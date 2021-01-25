class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :required_day

  validates :product_name,    presence: true, length: { maximum: 40 }
  validates :explanation,     presence: true, length: { maximum: 1000 }
  validates :price,           presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,           presence: true

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :required_day_id
  end
end
