class QuestionsController < ApplicationController
  before_action :set_test, only: [:index, :create]
  before_action :set_question, only: [:show, :destroy]

  def index
    result = @test.questions.pluck(:body)

    render plain: result.join("\n")
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)

    result = if question.save
               ["test_id: #{@test.id}",
                "Question id: #{question.id}",
                "Question Body: #{question.body}"]
             else
               ["Error!", question.errors.full_messages, "Question can not be created!"]
             end

    render plain: result.join("\n")
  end

  def destroy
    @question.destroy

    render plain: 'Question deleted'
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
