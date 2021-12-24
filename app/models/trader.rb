class Trader < ApplicationRecord
    has_many :stocks
    belongs_to :user
    
    def deposit_money 
        # cash in money which will be used to buy stocks
        # default for new trader = 0
        # current money + new deposits
    end

    def buy_stock
        # deduct money from current cash
    end

    def sell_stock
        # adds money to current cash
    end
end
