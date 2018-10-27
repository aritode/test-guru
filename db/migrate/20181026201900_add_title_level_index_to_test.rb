class AddTitleLevelIndexToTest < ActiveRecord::Migration[5.2]
  def change
    # Composite Index
    # used for - validates :title, uniqueness: { scope: :level }
    add_index :tests, [:title, :level], unique: true
  end
end
