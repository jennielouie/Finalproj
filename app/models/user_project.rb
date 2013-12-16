class UserProject < ActiveRecord::Base
    before_save :default_values
  def default_values
    self.currentInst = 1 if self.currentInst.nil?
    self.totalRep = 0 if self.totalRep.nil?
    self.repDone = 0 if self.repDone.nil?
  end

  attr_accessible :dueDate, :user_id, :project_id, :currentInst, :totalRep, :repDone

  belongs_to :user
  belongs_to :project
end
