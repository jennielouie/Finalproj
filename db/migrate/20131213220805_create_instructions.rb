class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.references :project
      t.integer :ordinal
      t.text :instext
      t.timestamps
    end
  end
end
