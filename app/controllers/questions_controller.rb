class QuestionsController < ApplicationController
  before_action :set_test

  def index
    result = @test.questions.pluck(:body)

    render plain: result.join("\n")
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end
end
