class Project < ActiveRecord::Base
  attr_accessible :projtitle, :author, :description, :pattern
  has_many :user_projects
  has_many :users, through: :user_projects

  validates :projtitle, :pattern, presence: true

end

