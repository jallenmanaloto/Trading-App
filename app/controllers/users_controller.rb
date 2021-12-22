class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        user = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        user = User.new(user_params)
        trader = Trader.new(
            name: user.name,
            user_id: user.id,
            status: false,
            total_cash: 0,
            total_stocks: 0,
            profit: 0,
            email: user.email
        )

        respond_to do |format|
            if @user.save
              format.html { redirect_to @user, notice: "User was successfully created." }
              format.json { render :show, status: :created, location: @user }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirm)
    end
end