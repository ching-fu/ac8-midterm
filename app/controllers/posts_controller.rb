class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post, :only => [:show,:edit,:update,:destroy]

	def newComment
		puts '---------------------------------'
		puts 'params=='+params.to_s+'......'
		puts '---------------------------------'	
		redirect_to :show	
	end	
	def listComment
		redirect_to :show
	end

	def index
		@myuser=current_user
		@posts=Post.page(params[:page]).per(5)
		#@posts=Post.all
	end

	def new
		@post=Post.new
	end
	def create
		@post=Post.new(approve_params)
		@post.user_id=current_user.id
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
		@myuser=current_user
	end

	private
	def approve_params
		params.require(:post).permit(:topic, :content, :category_id, :user_id, :comments=>[:post_id, :user_id, :msg])
	end

end
