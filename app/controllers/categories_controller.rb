class CategoriesController < ApplicationController
    def index
        categories = Category.left_outer_joins(:products)
                            .select('categories.id, categories.name, COUNT(products.id) AS products_count')
                            .group('categories.id, categories.name')
        render json: categories, status: :ok
    end    
end
