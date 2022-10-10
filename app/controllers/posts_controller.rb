class PostsController < ApplicationController
    def index
        @post = Post.new
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
