class Title < ApplicationRecord
    # Категория имеет много задачь и при удалении категории удалять и задачи
    has_many :tasks, dependent: :destroy
    # Перед записью нужно проверять name на наличие и уникальность
    validates :title, presence: true, uniqueness: true, length: {maximum: 140}
end
