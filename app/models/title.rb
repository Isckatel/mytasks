class Title < ApplicationRecord
    # Говорю, что категория имеет много продуктов и при удалении категории удалять и все ее продукты
    has_many :tasks, dependent: :destroy
    # Указываю, что перед записью нужно проверять name на наличие и уникальность
    validates :title, presence: true, uniqueness: true
end
