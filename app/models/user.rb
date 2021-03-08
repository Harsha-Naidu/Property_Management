class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :requests, dependent: :destroy


    validates :email,presence: {message: " should be present."},uniqueness: true
    validates :first_name,presence: true
    validates :last_name,presence: true
    
    
    has_secure_password

    def full_name
        "#{first_name} #{last_name}"
    end
end
