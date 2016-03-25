class PostsController < ApplicationController
	before_action :find_post, :only => [:show,:edit,:update,:destroy]

	# def newComment
		# puts '---------------------------------'
		# puts 'params=='+params.to_s+'......'
		# puts '---------------------------------'		
	# end	
	# def listComment
	# end

	def index
		@posts=Post.page(params[:page]).per(5)
		#@posts=Post.all
	end

	def new
		@post=Post.new
	end
	def create
		@post=Post.new(approve_params)
		@post.save
		redirect_to posts_path();		
	end
	def show
		puts '---------------------------------'
		puts 'params=='+params.to_s+'......'
		puts '---------------------------------'		
	end

	def edit
	end
	def update
		@post.update(approve_params)
		redirect_to posts_path();
	end

	def destroy
		@post.destroy
		redirect_to posts_path();
	end
	def find_post
		@post=Post.find(params[:id])		
	end

	private
	def approve_params
		params.require(:post).permit(:topic, :content)
	end

end
