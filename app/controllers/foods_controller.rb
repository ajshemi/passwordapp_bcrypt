class FoodsController < ApplicationController

    # get '/foods'
    def index
        @foods =Food.all
        render :index
    end

    def show 
        @food=Food.find_by(id: params[:id])
        render :show
    end

    def new
        @food=food.new
        render :new
    end

    def create
        Food.create(food_params)
        redirect_to "/foods"
    end

    private

    def food_params
        food_params=params.require(:food).permit(:foodname,:category)
    end

end
