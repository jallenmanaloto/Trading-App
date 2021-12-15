class UsersController < ApplicationController
    def index
        user = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    # def edit
    #     @user = User.find(params[:id])
    # end

    # def create
    #     @user = User.new(user_params)

    #     respond_to do |format|
    #         if @user.save
    #           format.html { redirect_to @user, notice: "User was successfully created." }
    #           format.json { render :show, status: :created, location: @user }
    #         else
    #           format.html { render :new, status: :unprocessable_entity }
    #           format.json { render json: @user.errors, status: :unprocessable_entity }
    #         end
    #       end
    # end

    # def update
    #     respond_to do |format|
    #         if @user.update(user_params)
    #           format.html { redirect_to @user, notice: "User was successfully updated." }
    #           format.json { render :show, status: :ok, location: @user }
    #         else
    #           format.html { render :edit, status: :unprocessable_entity }
    #           format.json { render json: @user.errors, status: :unprocessable_entity }
    #         end
    #       end
    # end

    # private

    # def user_params
    #     params.require(:user).permit(:name, :password, :password_confirm)
    # end
end