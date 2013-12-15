class UserProject < ActiveRecord::Base
  attr_accessible :dueDate, :user_id, :project_id, :currentInst, :totalRep, :repDone

  belongs_to :user
  belongs_to :project
end
