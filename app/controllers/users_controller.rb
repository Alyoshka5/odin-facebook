class UsersController < ApplicationController
    def index
        @friend_request = current_user.friend_requests.new
        @users = User.where.not(id: current_user.id)
        @pending_requests = FriendRequest.where(friend_id: current_user).pluck(:user_id)
        @pending_friends = User.where(id: @pending_requests)
        @friends = current_user.friends
        @suggested = User.where.not(id: @pending_friends).where.not(id: @friends).where.not(id: current_user)
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.posts
        @profile = @user.profile
    end
end
