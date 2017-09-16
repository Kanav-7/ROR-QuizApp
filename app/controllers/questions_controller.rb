class QuestionsController < ApplicationController
  def show
  	@questions = Question.where(quiz_type: params[:quiz_type])	
  end
end
