class AddCorrectquestionsToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :correct_questions, :integer, default: 0
  end
end
