class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]

  def show

  end

  def result

  end

  def update
    render :show
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
