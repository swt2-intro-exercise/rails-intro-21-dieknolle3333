class AuthorsController < ApplicationController
    def new
    end

    def create
       @author = Author.new(author_params)
       @author.save
       redirect_to root_path, notice: 'Success!'
    end

    def index
        @authors = Author.all
    end

    def show
        @author = Author.find(params[:id])
    end

    private
        def author_params
            params.require(:author).permit(:first_name, :last_name, :homepage)
        end

end