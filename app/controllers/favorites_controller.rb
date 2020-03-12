class FavoritesController < ApplicationController

	def create
		# @favorite = current_user.favorites.create(book_id: params[:book_id])
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.new(book_id: book.id)
		p "いいね"
		favorite.save
		p "saveあと"
		# ↓直前のページにリダイレクト
		redirect_back(fallback_location: root_path)
	end

	def destroy
		# @favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
  #   	@favorite.destroy
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: book.id)
		p "よくない"
		favorite.destroy
		redirect_back(fallback_location: root_path)
	end

	

end
