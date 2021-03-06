class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects

  validates :password, presence: true, length: {minimum: 6}
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

end
