class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projtitle
      t.text :description
      t.string :author
      t.text :pattern
      t.timestamps
    end
  end
end
