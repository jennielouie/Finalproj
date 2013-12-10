class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.references :project
      t.references :user
      t.datetime :dueDate
      t.timestamps
      t.timestamps
    end
  end
end
