class UsersController < ApplicationController
    def index
        @users = User.where.not(id: current_user.id)
        @friend_request = current_user.friend_requests.new
    end
end
