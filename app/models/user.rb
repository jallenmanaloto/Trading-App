class User < ApplicationRecord
    has_one :admin
    has_one :trader
end
