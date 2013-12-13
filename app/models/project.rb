class Project < ActiveRecord::Base
  attr_accessible :projtitle, :author, :notes, :patternFile
  has_many :user_projects
  has_many :users, through: :user_projects

  has_attached_file :patternFile

  validates :projtitle, presence: true

# def mstring
#   #data = patternFile.copy_to_local_file.read
#   #data = ''
#   #f = File.open(patternFile, "r")
#   #f.each_line do |line|
#   #  data += line
#   #end
#   #return data
#   return patternFile.copy_to_local_file
# end


end

