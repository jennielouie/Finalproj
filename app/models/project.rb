require 'pry'
class Project < ActiveRecord::Base
  attr_accessible :projtitle, :author, :description, :pattern
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :instructions

  validates :projtitle, :pattern, presence: true

#parsePattern parses the pattern text into instructions, and saves to Instruction database
  def parsePattern

# Regexs below search for a capital letter followed by any character, and ending with :.  For cases where previous line does not end with a .
    # foo = pattern.scan(/[A-Z].+\s*\d:/)
    # bar = pattern.split(/[A-Z].+\s*\d:/)

#foo collects all instances of the regex expression, bar collects text between the regex instances.  Regex scans for a period, followed by a string that includes anything except a period, followed by : (e.g. .  Rnd 5:)'
    foo = self.pattern.scan(/\.[^.]+:/)
    bar = self.pattern.split(/\.[^.]+:/)
    # bar[0] includes all text up to the first instance of the regex expression.  Need to add before loop.
    Instruction.create({project_id: self.id, ordinal:'1', instext: bar[0] })
    #Loop through each foo bar pair and save as record in Instruction database, accounting for the index being 1 higher for bar than foo

     for i in (1..foo.length)
      foobar = foo[i-1] + bar[i]
      Instruction.create({project_id: self.id, ordinal:i+1, instext: foobar })
     end
  end

end

