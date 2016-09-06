class AddDoneColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :done, :boolean
  end
end
