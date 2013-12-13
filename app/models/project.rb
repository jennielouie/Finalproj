class Project < ActiveRecord::Base
  attr_accessible :projtitle, :author, :description, :pattern
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :instructions

  validates :projtitle, :pattern, presence: true

def parsePattern
foo = pattern.scan(/[a-zA-Z]+\s{1}\d+:/)
bar = pattern.split(/[a-zA-Z]+\s{1}\d+:/)
# foo = pattern_data.scan(/\b\s*(.+):/)
# bar = pattern_data.split(/\b\s*(.+):/)

num=0
foobar =[]
Instruction.create({project_id: self.id, ordinal:'1', instext: bar[0] })
 for i in (1..foo.length)
  foobar= foo[i-1] + bar[i]
  Instruction.create({project_id: self.id, ordinal:i+1, instext: foobar })
 end
end

end

