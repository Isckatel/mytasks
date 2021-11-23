class Task < ApplicationRecord
  # Указываю, что продукт принадлежит категории
  belongs_to :title
  # указываю, что нужно проверять name на наличие и уникальность
  # а цену на наличие и на больше нуля
  validates :text, presence: true, uniqueness: true
end
