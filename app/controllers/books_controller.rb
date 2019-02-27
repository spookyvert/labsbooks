class BooksController < ApplicationController
  before_action :get_book, only: [:show, :edit, :update, :destroy]
    def index
      @books = Book.all
    end

    def show; end

    def edit; end
      
    def update
      if @book.update(book_params)
        redirect_to book_path(@book)
      else
        render :edit
      end
    end

    def destroy
      @book.destroy
      redirect_to :action => "index"
    end

    private

    def book_params
      params.require(:book).permit(:title, :pages)
    end

    def get_book
      @book = Book.find(params[:id])
    end
  
end
