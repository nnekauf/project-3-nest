class Reader < ApplicationRecord
    has_many :reviews
    has_many :books, through: :reviews

    has_secure_password

    validates_uniqueness_of :username
    validates_presence_of :username
    
    
    validates_uniqueness_of :email
    validates_presence_of :email
end

