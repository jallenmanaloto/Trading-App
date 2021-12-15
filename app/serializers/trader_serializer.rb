class TraderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :status, :total_cash, :total_stocks, :profit
end
