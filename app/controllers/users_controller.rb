class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def following
        #@userがフォローしているユーザー
        @user  = User.find(params[:id])
        @users = @user.following
        render 'show_follow'
    end

    def followers
        #@userをフォローしているユーザー
        @user  = User.find(params[:id])
        @users = @user.followers
        render 'show_follower'
    end
end
