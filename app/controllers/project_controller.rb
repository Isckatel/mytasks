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
        @titles = Title.select("titles.id, titles.title")
        titleList = @titles.to_json
        titleListHash = JSON.parse(titleList)

        # Список задач        
        for i in (1..countTitle)
            titleListHash[i-1]['todos'] = Task.select('tasks.id, tasks.text, tasks."isCompleted"').where(title_id:i).as_json
        end        
        # test << { :status => "Success" }
        # puts titletest.public_methods
        # render json: titleListHash, status: :ok
    end

    #test add
    def add
        @title = Title.new        
    end 

    def create
        @title = Title.new(title: params[:title])
        if @title.save
            redirect_to "/projects/add"
        else
            redirect_to "/projects/add" #render :new #Еще рендарим эту страницу
        end

        # render plain: params
    end


    #PATCH  /projects/:id/todos/:id — обновить задачу.
    def update
        puts "Попали в  update"
        task = Task.find(params[:todos])
        if task.update_attributes(isCompleted: !task.isCompleted)
            render json: task, status: :ok
        else
            render json: {errors: task.errors}, status: :unprocessable_entity
        end
    end

    # POST /todos
    def new
        #проверить есть ли в базе?
        if Title.where(title: params[:title]).exists?
            #Есть в базе раздел 
            findTitle = Title.find_by(title: params[:title])
            Task.create( title_id: findTitle.id, text: params[:text], isCompleted: false )            
        else
            #Нет в базе раздела
            newTitle = Title.create(title: params[:title])
            Task.create( title_id: newTitle.id, text: params[:text], isCompleted: false )           
        end
        lastTask = Task.last    
        render json: lastTask, status: :ok
    end

end
