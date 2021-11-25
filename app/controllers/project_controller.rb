class ProjectController < ApplicationController
     # GET /titles
    def index
        # titles = Title.left_outer_joins(:tasks).select('titles.id, titles.title, COUNT(tasks.id) AS tasks_count').group('titles.id, titles.title')
        # titles = Title.joins("join tasks on titles.id = tasks.title_id").select('titles.id, titles.title, tasks.id, tasks.text, tasks."isCompleted"')

        # Колличество разделов
        countTitleSQL = Title.select("COUNT(*) AS count").to_json             
        countTitleHash = JSON.parse(countTitleSQL).first
        countTitleHash["todos"] = "Success"  
        countTitle = countTitleHash['count']

        # Cписок разделов
        titleList = Title.select("titles.id, titles.title").to_json
        titleListHash = JSON.parse(titleList)

        # Список задач        
        for i in (1..countTitle)
            titleListHash[i-1]['todos'] = Task.select('tasks.id, tasks.text, tasks."isCompleted"').where(title_id:i).as_json
        end        
        # test << { :status => "Success" }
        # puts titletest.public_methods
        render json: titleListHash, status: :ok
    end
    #PATCH  /projects/:id/todos/:id — обновить задачу.
    def update

    end
    # POST /todos
    def new
        test = {"message"=>"OK"}
        puts params[:title] #проверить есть ли в базе?
        render json: test, status: :ok
    end
end
