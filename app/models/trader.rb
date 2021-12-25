class Trader < ApplicationRecord
    has_many :stocks
    belongs_to :user
    
    def deposit_money(amount)
        # cash in money which will be used to buy stocks
        # default for new trader = 0
        # current money + new deposits

        new_balance = self.total_cash += amount
        self.total_cash = new_balance

    end

    def buy_stock(amount)
        # deduct money from current cash
        # add quantity based from purchase
        new_balance = self.total_cash - amount
        self.total_cash = new_balance
    end

    def sell_stock
        # adds money to current cash
    end
end
