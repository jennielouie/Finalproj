class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.references :project
      t.references :user
      t.datetime :dueDate
      t.timestamps
    end
  end
end
