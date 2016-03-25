class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post, :only => [:show,:edit,:update,:destroy,:newComment]

	def newComment
		puts '---------------------------------'
		puts 'params=='+params.to_s+'......'
		puts '---------------------------------'
		comment=Comment.new(:post_id=>params[:id],:user_id=>current_user.id)
		post=params[:post]
		puts post
		comment.msg=post[:comments][:msg]
		puts comment.msg
		comment.save
		redirect_to post_path(@post)
	end	
	def listComment
		redirect_to post_path(@post)
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
		u=User.where(:id=>@post.user_id)
#		puts u
#		puts u[:email]
#		@owner=u[:email]
		@comments=Comment.where(:post_id=>params[:id])
		#puts @comment[1].msg
#		puts @owner
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
