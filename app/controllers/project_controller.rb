class ProjectController < ApplicationController
    def index
        answer = {
            "message" => "ok"
        }
        render json: answer
    end
end
