class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string  :name,       null: false
      t.string  :image_url,  null: false
      t.string  :rule_type,  null: false
      t.integer :rule_option

      t.timestamps
    end
  end
end
