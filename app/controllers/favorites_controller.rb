class FavoritesController < ApplicationController
	def create
		@book = Book.find(params[:id])
		@favorite = current_user.favorites.new(book_id: @book.id)
	    @favorite.save
	    if   request.fullpath.include?(:id)
             redirect_to book_path(book)
        else redirect_to books_path
        end
	end

	def destroy
		@book = Book.find(params[:id])
		@favorite = current_user.favorites.find_by(book_id: @book.id)
	    @favorite.destroy
	    if   request.fullpath.include?(:id)
             redirect_to book_path(book)
        else redirect_to books_path
        end
	end
end
