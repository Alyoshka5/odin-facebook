class CommentsController < ApplicationController
    def index
        @post = Post.find(params[:post_id])
        @comment = Comment.new
    end
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(content: params[:content])
        @comment.user = current_user

        if @comment.save
            redirect_to post_comments_path(@post)
        else
            redirect_to post_comments_path(@post), status: :unprocessable_entity
        end
    end
end
