class PostsController < ApplicationController

    before_action :authenticate_user!

    before_action :set_post, only: %i(show destroy)
    
    def new
        @post = Post.new
        @post.photos.build
        @post.post_items.build
    end

    def create
        @post = Post.new(post_params)
        if @post.photos.present?
            @post.save
            redirect_to root_path
            flash[:notice] = "投稿が保存されました"
        else
            redirect_to root_path
            flash[:alert] = "投稿に失敗しました"
        end
    end

    def index
        @posts = Post.limit(10).includes(:photos, :user).order('created_at DESC')
    end

    def show
        @num =0
    end

    def destroy
        if @post.user == current_user
        flash[:notice] = "投稿が削除されました" if @post.destroy
        else
        flash[:alert] = "投稿の削除に失敗しました"
        end
        redirect_to root_path
    end

    def search
        @posts = Post.search(params[:keyword]).order('created_at DESC')
        @keyword = params[:keyword]
        render "index"
    end

    private
        def post_params
            params.require(:post).permit(:caption, photos_attributes: [:image], post_items_attributes: [:text, :img]).merge(user_id: current_user.id)
        end

        def set_post
            @post = Post.find_by(id: params[:id])
        end
end
