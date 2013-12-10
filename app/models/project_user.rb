class ProjectUser < ActiveRecord::Base
  attr_accessible :dueDate, :user_id, :project_id

  belongs_to: user
  belongs_to: project
end
