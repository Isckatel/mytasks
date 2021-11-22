class Product < ApplicationRecord
  # Указываю, что продукт принадлежит категории
  belongs_to :category
  # указываю, что нужно проверять name на наличие и уникальность
  # а цену на наличие и на больше нуля
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than: 0}
end
