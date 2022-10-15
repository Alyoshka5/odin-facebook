class FriendRequestsController < ApplicationController
    before_action :set_friend_request, except: [:index, :new, :create]

    def index
        @incoming = FriendRequest.where(friend: current_user)
        @outgoing = current_user.friend_requests
    end

    def create
        friend = User.find(friend_request_params()['friend_id'])
        return if friend.pending_friends.include?(current_user) || current_user.pending_friends.include?(friend)
        @friend_request = current_user.friend_requests.new(friend: friend)

        if @friend_request.save
            redirect_to users_path
        else
            render json: @friend_requests.errors, status: :unprocessable_entity
        end
    end

    def update
        @friend_request.accept
        redirect_back(fallback_location: users_path)
    end

    def destroy
        @friend_request.destroy
        redirect_back(fallback_location: users_path)
    end

    private

    def set_friend_request
        @friend_request = FriendRequest.find(params[:id])
    end

    def friend_request_params
        params.require(:friend_request).permit(:friend_id)
    end
end
