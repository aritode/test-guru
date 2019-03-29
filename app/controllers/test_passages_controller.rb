class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def gist
    gist_service = GistQuestionService.new(@test_passage.current_question)
    result = gist_service.call
    gist_url = result.html_url
    gist_url_tag = %(<a href="#{gist_url}" target="_blank">gist.github.com</a>)

    flash_options = if gist_service.success?
                      { notice: t('.success', url: gist_url_tag) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
