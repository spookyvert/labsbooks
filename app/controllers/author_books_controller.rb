class AuthorBooksController < ApplicationController
  

  def create
    
    @ab = AuthorBook.new(ab_params)
    
    if @ab.valid?
      @ab.save
      
      redirect_to "/books/#{@ab.book_id}"
    else
      render :new
    end
  end
 

  def destroy
    @authorbook = AuthorBook.find(params[:id])
    @book_id = @authorbook.book_id 
    @authorbook.destroy
    redirect_to "/books/#{@book_id}"

  end

  private
  def ab_params
    params.require(:author_book).permit(:author_id, :book_id)
  end

end