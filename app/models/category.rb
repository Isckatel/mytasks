class Category < ApplicationRecord
    # Говорю, что категория имеет много продуктов и при удалении категории удалять и все ее продукты
    has_many :products, dependent: :destroy
    # Указываю, что перед записью нужно проверять name на наличие и уникальность
    validates :name, presence: true, uniqueness: true
end
