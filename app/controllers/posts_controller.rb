class PostsController < ApplicationController
    def index
        @post = Post.new
        @posts = Post.where(user_id: current_user.friends).or(Post.where(user_id: current_user)).order(created_at: :desc).limit(50)
    end

    def create
        @post = current_user.posts.build(post_params())

        if @post.save
            redirect_to root_path
        else
            redirect_to root_path
        end
    end

    private

    def post_params
        params.require(:post).permit(:content)
    end
end
