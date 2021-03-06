class PostsController < ApplicationController
  def new
		@post = Post.new
  end

  def index
		@posts = Post.all
		# @posts = current_user.posts
  end

  def show
		@post = Post.find(params[:id])
		# @post.user = current_user
  end
	
	def create 
		@post = Post.new(permit_post)
		# NOT WORKING ? ? ? @post.user = current_user
	
		if @post.save 
			flash[:success] = 'Image posted!'
			redirect_to post_path(@post)
		else
			flash[:error] = @post.errors.full_messages
			redirect_to new_post_path
		end
	end
	
	
	private 
		def permit_post
			params.require(:post).permit(:image, :description)
			# Helps prevent SQL injections via HTML. User is only permited to edit these fields via their respective attributes
		end
end
