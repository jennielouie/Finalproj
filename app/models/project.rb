class Project < ActiveRecord::Base
  attr_accessible :projtitle, :author, :notes, :duedate
end

