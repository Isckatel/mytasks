class Task < ApplicationRecord
  # задачи принадлежат категории
  belongs_to :title
  # проверять name на наличие
  validates :text, presence: true, length: {maximum: 300}
end
