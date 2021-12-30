class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :confirmable
    #validates_presence_of :name, presence_of: :email, presence_of: :password
    validates :name, length: { minimum: 5, maximum: 20 }
    validates_presence_of :name, :email, :password
        


    has_one :admin
    has_one :trader
    # before_create :skipping_confirm
    # after_create :send_pending

    def skipping_confirm
        self.skip_confirmation!
    end

    def send_pending
        UserMailer.approve_account(self).deliver_later
    end
end
