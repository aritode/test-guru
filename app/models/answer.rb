class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_max_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers_count
    message = 'can only have maximum 4 answers!'
    errors.add(:question, message) if question.answers.count >= 4
  end
end
