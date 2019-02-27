class AuthorsController < ApplicationController

  before_action :get_author, only: [:show, :edit, :update, :destroy]

    def index
      @authors = Author.all
    end

    def show; end

    def new
      @author = Author.new
    end

    def create
      @author = Author.new(authors_params)
      if @author.valid?
        @author.save
        redirect_to author_path(@author)
      else
        render :new
      end
    end

    def edit; end

    def update
      if @author.update(authors_params)
        redirect_to author_path(@author)
      else
        render :edit
      end
    end

    def destroy
      @author.destroy
      redirect_to :action => 'index'
    end
    private

    def get_author
      @author = Author.find(params[:id])
    end

    def authors_params
      params.require(:author).permit(:name, :birth_year)
    end

end
