class Project < ActiveRecord::Base
  attr_accessible :projtitle, :author, :notes, :patternFile
  has_many :user_projects
  has_many :users, through: :user_projects

  has_attached_file :patternFile

  validates :projtitle, presence: true
end

