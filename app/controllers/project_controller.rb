class ProjectController < ApplicationController
    # def index
    #     answer = {
    #         "message" => "ok"
    #     }
    #     render json: answer
    # end
    # GET /titles
    def index
        # titles = Title.left_outer_joins(:tasks)
        #                     .select('titles.id, titles.title, COUNT(tasks.id) AS tasks_count')
        #                     .group('titles.id, titles.title')
        titletest = Title.select("id, title")
        puts titletest.public_methods 
        titles = Title.joins("join tasks on titles.id = tasks.title_id").select('titles.id, titles.title, tasks.id, tasks.text, tasks."isCompleted"')
        render json: titletest, status: :ok
    end
    # Category.left_outer_joins(:products)
    #                         .select('categories.id, categories.name, COUNT(products.id) AS products_count')
    #                         .where(id: id)
    #                         .group('categories.id, categories.name')
end
