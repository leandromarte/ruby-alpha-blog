class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  
  before_save { self.email = email.downcase }
  
  validates :username, presence: true, 
            uniqueness: {case_sensitive: false}, 
            length: {minimum: 3, maximum: 45}
            
            REGEX_VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
            
  validates :email, presence: true,
            uniqueness: {case_sensitive: false}, 
            length: {maximum: 100},
            format: {with: REGEX_VALID_EMAIL}
            
  has_secure_password
end