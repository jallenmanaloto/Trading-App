class History < ApplicationRecord
    validates_presence_of :transaction_name, :stock_name, :symbol, :quantity, :price
    validates :transaction_name, inclusion: { in: %w(Buy Sell) }
    belongs_to :trader
end
