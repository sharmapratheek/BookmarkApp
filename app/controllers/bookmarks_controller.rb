class BookmarksController < ApplicationController

	before_action :authenticate_user!,except: [:index, :show]

	def index
		@bookmark = Bookmark.all
	end

	def new 
		@bookmark = current_user.bookmarks.build
	end 

	def create  
		@bookmark =	current_user.bookmarks.build(bookmark_params)
		if @bookmark.save
			flash[:success] = "Bookmark has been created successfully"
			redirect_to bookmark_path(@bookmark)
		else 
			render 'new'
		end
	end 

	def edit 
		@bookmark = Bookmark.find(params[:id])

	end 

	def update 
		@bookmark =  Bookmark.find(params[:id])
		if @bookmark.update(bookmark_params)
			flash[:success] = "Bookmark has been Edited successfully"
			redirect_to bookmarks_path
		else 
			render "edit"
		end
	end 

	def show 
		@bookmark = Bookmark.find(params[:id])
	end 

	def destroy 
		@bookmark = Bookmark.find(params[:id])
		if @bookmark.destroy
			flash[:notice] = "Bookmark has been deleted successfully "
			redirect_to bookmarks_path
		else 
			render "index"
		end
	end 

	private 
	def bookmark_params
		params.require(:bookmark).permit(:bookmark_name)
	end

end	