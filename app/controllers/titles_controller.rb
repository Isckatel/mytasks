class TitlesController < ApplicationController
    # GET /titles
    def index
        titles = Title.left_outer_joins(:tasks)
                            .select('titles.id, titles.title, COUNT(tasks.id) AS tasks_count')
                            .group('titles.id, titles.title')
        render json: titles, status: :ok
    end
end
