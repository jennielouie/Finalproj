class UserProject < ActiveRecord::Base
  before_save :default_values
  # These default values will set the instruction ordinal, repeats and repeats completed values when project is first started.
    def default_values
      self.currentInst = 1 if self.currentInst.nil?
      self.totalRep = 0 if self.totalRep.nil?
      self.repDone = 0 if self.repDone.nil?
    end
  attr_accessible :dueDate, :user_id, :project_id, :currentInst, :totalRep, :repDone
  belongs_to :user
  belongs_to :project
  validates :project_id, uniqueness: true
end
