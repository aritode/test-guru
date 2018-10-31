class QuestionsController < ApplicationController
  before_action :set_test, only: [:index, :create]

  def index
    result = @test.questions.pluck(:body)

    render plain: result.join("\n")
  end

  def show
    @question = Question.find(params[:id])

    render plain: @question.body
  end

  def new
  end

  def create
    question = @test.questions.create(question_params)

    result = ["test_id: #{@test.id}",
              "Question id: #{question.id}",
              "Question Body: #{question.body}"]

    render plain: result.join("\n")
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
