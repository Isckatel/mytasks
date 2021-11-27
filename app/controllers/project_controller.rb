class ProjectController < ApplicationController
     # GET /titles
    def index        
        # Колличество разделов
        countTitleSQL = Title.select("COUNT(*) AS count").to_json             
        countTitleHash = JSON.parse(countTitleSQL).first         
        countTitle = countTitleHash['count']

        # Cписок разделов
        @titles = Title.select("titles.id, titles.title")
        titleList = @titles.to_json
        titleListHash = JSON.parse(titleList)

        # Список задач        
        for i in (1..countTitle)
            titleListHash[i-1]['todos'] = Task.select('tasks.id, tasks.text, tasks."isCompleted"').where(title_id:i).as_json
        end        
        render json: titleListHash, status: :ok
    end   

    #PATCH  /projects/:id/todos/:id — обновить задачу.
    def update
        @task = Task.find_by id: params[:id]
        @task.isCompleted = !@task.isCompleted
        if @task.save
            #redirect_to "/projects/"+@task.title_id.to_s+"/todo/"+@task.id.to_s
            render json: @task, status: :ok
        else
            # redirect_to "/projects/"+@task.title_id.to_s+"/todo/"+@task.id.to_s
            render json: {errors: @task.errors}, status: :unprocessable_entity
        end
    end      
    
    # POST /todos
    def new     
        if Title.where(title: params[:title]).exists?
            @title = Title.find_by(title: params[:title])          
        else
            @title = Title.create(title: params[:title])                     
        end
        task = Task.create( title_id: @title.id, text: params[:text], isCompleted: false)

        if task.errors.empty?            
            render json: task, status: :ok
        else
            render json: {errors: task.errors}, status: :unprocessable_entity
        end    
    end
end
