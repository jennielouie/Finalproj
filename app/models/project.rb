
class Project < ActiveRecord::Base
before_save :default_values

  def default_values
    self.regexCode = 2 if self.regexCode.nil?
  end

  attr_accessible :projtitle, :author, :description, :pattern, :regexCode
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :instructions

  validates :projtitle, :pattern, presence: true

#parsePattern parses the pattern text into instructions using regular expressions, and saves to Instruction database
  def parsePattern
    case regexCode

      # foo collects all instances of the regex expression, bar collects text between the regex instances.  bar[0] includes all text up to the first instance of the regex expression.  Need to add before loop.

      when 1 # Regex below search for a capital letter followed by any character, and ending with :.  For cases where previous line does not end with a .
        foo = self.pattern.scan(/[A-Z].+\s*\d:/)
        bar = self.pattern.split(/[A-Z].+\s*\d:/)
        createparsedInstruction

      when 2 # Regex scans for a period, followed by a string that includes anything except a period, followed by : (e.g. .  Rnd 5:)'
        foo = self.pattern.scan(/\.[^.]+:/)
        bar = self.pattern.split(/\.[^.]+:/)
        createparsedInstruction

      when 3 #Start of instruction indicated by ., does not end with period
        foo = self.pattern.scan(/\s+[A-Z][\S]+\./)
        bar = self.pattern.split(/\s+[A-Z][\S]+\./)
        createparsedInstruction

      when 4 #Start of instruction indicated by number followed by a parens -->[number]), does not end with period
        foo = self.pattern.scan(/\s+\d+\)/)
        bar = self.pattern.split(/\s+\d+\)/)
        createparsedInstruction

      when 5 #No pattern parsing
        Instruction.create({project_id: self.id, ordinal:'1', instext: self.pattern})

    end
  end

  def createparsedInstruction
    Instruction.create({project_id: self.id, ordinal:'1', instext: bar[0]})
    #Loop through each foobar pair and save as record in Instruction database, accounting for the index being 1 higher for bar than foo
      for i in (1..foo.length)
        foobar = foo[i-1] + bar[i]
        Instruction.create({project_id: self.id, ordinal:i+1, instext: foobar})
      end
  end
end

