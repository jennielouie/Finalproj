class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projtitle
      t.string :author
      t.text :notes
      t.datetime :duedate
      t.timestamps
    end
  end
end
