module Api
    module V1
        class TradersController < ApplicationController

            skip_before_action :verify_authenticity_token
            respond_to :json

            def index
                traders = Trader.all
            end
        
            def show 
                trader = Trader.find(params[:id])
            end
        
            def edit
                trader = Trader.find(params[:id])
            end
        
            def create
                user = User.create(trader_params)
                trader = Trader.create(:name => user.name, :email => resource.email, :user_id => resource.id, :status => false)
                respond_to do |format|
                    if trader.save
                        format.html { redirect_to @user, notice: "User was successfully created." }
                        format.json { render :show, status: :created, location: @user }
                    else
                        format.html { render :new, status: :unprocessable_entity }
                        format.json { render json: @user.errors, status: :unprocessable_entity }
                    end
            end
        
            def update
                trader = Trader.find(params[:id])
        
                if trader.save
                    # render json response
                    # should redirect page
                else
                    # render json error message
                    # render { error.message, status: 422 }
                end
            end
        
            private
        
                def trader_params
                    params.require(:user).permit(:name, :email)
                end
            end
        end
    end
end




