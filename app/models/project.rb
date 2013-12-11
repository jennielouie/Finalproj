class Project < ActiveRecord::Base
  attr_accessible :projtitle, :author, :notes
  # , :patternFile
  has_many :users, through: :project_users

  # has_attached_file :patternFile

  validates :projtitle, presence: true
end

