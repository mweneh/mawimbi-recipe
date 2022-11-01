class User < ApplicationRecord
    enum user_type: { regular: 0, admin: 1}
    has_secure_password
    has_many :recipes
    validates :username, uniqueness: true, presence: true
    validates :email , presence: true,uniqueness:{case_sensetive:false}
end
