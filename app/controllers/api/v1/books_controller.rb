class Api::V1::BooksController < ApplicationController

   def index
   	
     @books = Book.all
    render 'books/books.json.jbuilder', books: @books
   end


   def show
   		@book = Book.find_by(id: params[:id])
   		if @book
   			render 'books/book.json.jbuilder', book: @book
   		else
   			render json: {
   				errors: {
   					message: "Page not found"
   				}
   			}, status: 404
   		end

   end

   def create
   			@book = Book.new(book_params)
   			if @book.save
   				render '/books/book.json.jbuilder', book: @book
   			else
   				render json: {
   					errors: @book.errors.full_messages
   				}, status: 500
   			end
   		
   end

   def update
   			@book = Book.find_by(id: params[:id])
   			if @book.update_attributes(book_params)
   				render 'books/book.json.jbuilder', book: @book
   			else
   				render json: {
   					errors: @book.errors.full_messages
   				}, status: 500
   			end
   		
   end

   def destroy
   		book = Book.find_by(id: params[:id])
   		if book
   			book.destroy
   			head :no_contnet
   		else
   			render json: {
   				errors: {
   					message: "Page not found"
   				}
   			}, status: 404
   		end

   end

  private

    def book_params
      params.require(:book).permit(:title, :author, :rating, :notes)
    end


end
