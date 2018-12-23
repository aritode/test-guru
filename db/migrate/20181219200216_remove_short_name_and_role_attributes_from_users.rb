class RemoveShortNameAndRoleAttributesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_columns(:users, :name, :role)
  end
end
