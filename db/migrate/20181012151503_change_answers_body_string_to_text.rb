class ChangeAnswersBodyStringToText < ActiveRecord::Migration[5.2]
  def up
    change_column :answers, :body, :text
  end

  def down
    # string must be < 255 characters
    change_column :answers, :body, :string
  end
end
