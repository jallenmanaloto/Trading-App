class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
    has_one :admin
    has_one :trader
    accepts_nested_attributes_for :trader
end
