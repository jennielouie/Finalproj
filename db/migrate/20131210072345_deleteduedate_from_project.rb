class DeleteduedateFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :duedate
  end


end
