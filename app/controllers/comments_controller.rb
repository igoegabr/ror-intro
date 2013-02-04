class CommentsController < ApplicationController
	http_basic_authenticate_with :name => "ig", :password => "secret", :except => [:index, :show]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		if @comment.save
			redirect_to post_path(@post)
		else
			redirect_to 'http://ya.ru'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
end
