class Instruction < ActiveRecord::Base
  attr_accessible :project_id, :instext, :ordinal
  belongs_to :project
end
