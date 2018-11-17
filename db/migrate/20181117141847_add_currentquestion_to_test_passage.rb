class AddCurrentquestionToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_reference :test_passages, :current_question, foreign_key: true
  end
end
