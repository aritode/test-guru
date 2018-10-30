class QuestionsController < ApplicationController
  before_action :set_test, only: :index

  def index
    result = @test.questions.pluck(:body)

    render plain: result.join("\n")
  end

  def show
    @question = Question.find(params[:id])

    render plain: @question.body
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end
end
