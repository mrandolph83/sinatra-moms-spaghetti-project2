require 'bcrypt'
class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    has_many :recipes
    has_many :reviews
end
