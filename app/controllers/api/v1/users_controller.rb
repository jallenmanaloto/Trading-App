module Api
    module V1
        class UsersController < ApplicationController
            # before_action :authenticate_user!
            skip_before_action :verify_authenticity_token
            respond_to :json

            def new
            end
            
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
                # respond_to do |format|
                    if user.save
                        trader = Trader.create(
                            :name => user.name, 
                            :email => user.email, 
                            :user_id => user.id, 
                            :status => false
                        )
                    else
                      format.json { render json: user.errors, status: :unprocessable_entity }
                    end
                # end
            end
        
            private
        
            def user_params
                params.permit(:name, :email, :password, :password_confirm)
            end
        end
    end
end

