class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.references :project
      t.references :user
      t.datetime :dueDate
      t.integer :currentInst
      t.integer :totalRep
      t.integer :repDone
      t.timestamps
    end
  end
end
