class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.references :project
      t.integer :ordinal
      t.boolean :counter
      t.text :intext
      t.timestamps
    end
  end
end
