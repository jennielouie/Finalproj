class AddRadio < ActiveRecord::Migration
  def change
   add_column :projects, :regexCode, :integer
  end

  def down
  end
end
