class LinksController < ApplicationController 
	before_action :authenticate_user!
	# before_action :require_admin, except: [:show,:index]

	def show
		@link = Link.find(params[:id])
	end

	def index 
		# @link = Link.all
		@book = Bookmark.find(params[:book])
		@link = @book.links
	end

	def new
		@link = Link.new		

	end

	def create
		@book = Bookmark.find(params[:book])
		@link = Link.create(link_params)	

		if @link.save
			@link.bookmark_id = @book.id
			@link.save
			flash[:success] = "Link has been created successfully"
			redirect_to link_path(@link)
		else 
			render 'new'
		end
	end

	def edit
		@link = Link.find(params[:id])
	end

	def update
		@link = Link.find(params[:id])
		if @link.update(link_params)
			flash[:success] = "Link has been updated successfully"
			redirect_to links_path
		else
			render 'edit'
		end
	end

	def destroy
		@link = Link.find(params[:id])
		 if @link.destroy
		 	flash[:id] = "Link has been deleted successfully"
		 	redirect_to links_path
		 else
		 	render 'index'
		 end
	end

	private

	def link_params
		params.require(:link).permit(:link)
	end

	

end
