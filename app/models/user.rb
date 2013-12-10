class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :projects, through: :project_users

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
