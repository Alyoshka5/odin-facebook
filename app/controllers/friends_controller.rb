class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy
  validate :not_self

  def index
    @friends = current_user.friends
  end

  def destroy
    current_user.remove_friend(@friend)
    head :no_content
  end
end
