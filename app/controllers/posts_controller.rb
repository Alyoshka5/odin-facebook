class PostsController < ApplicationController
    def index
        @post = Post.new
        @posts = Post.where(user_id: current_user.friends).or(Post.where(user_id: current_user)).order(created_at: :desc).limit(50)
        @pending_requests = FriendRequest.where(friend_id: current_user).pluck(:user_id)
        @pending_friends = User.where(id: @pending_requests)
    end

    def create
        @post = current_user.posts.build(post_params())

        if @post.save
            redirect_back(fallback_location: root_path)
        else
            redirect_to root_path, status: :unprocessable_entity
        end
    end

    def like
        @post = Post.find(params[:post_id])
        @like = @post.likes.build
        @like.user = current_user
        if @like.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end
    
    def unlike
        @post = Post.find(params[:post_id])
        @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
        if @like.destroy
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    private

    def post_params
        params.require(:post).permit(:content)
    end
end
