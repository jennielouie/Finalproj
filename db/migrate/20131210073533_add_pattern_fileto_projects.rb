class AddPatternFiletoProjects < ActiveRecord::Migration
  def change
    add_attachment :projects, :patternFile
  end


end
