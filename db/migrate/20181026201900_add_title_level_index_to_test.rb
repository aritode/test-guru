class AddTitleLevelIndexToTest < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, :level, unique: true
    add_index :tests, :title, unique: true
  end
end
