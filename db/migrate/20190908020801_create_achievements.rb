class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.references :badge, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
