class ShopsController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @shop = Shop.new
    end

    def create
        @shop = Shop.new(shop_params)
        if @shop.save
            redirect_to root_path
            flash[:notice] = "投稿が保存されました"
        else
            redirect_to root_path
            flash[:alert] = "投稿に失敗しました"
        end
    end

    def show
        @shop = Shop.find(params[:id])
        gon.shop = @shop #追記
    end

    def index
        @shops = Shop.all.order('created_at DESC')
    end

    private
        def shop_params
            params.require(:shop).permit(:name, :address, :img, :latitude, :longitude).merge(user_id: current_user.id)
        end
end
