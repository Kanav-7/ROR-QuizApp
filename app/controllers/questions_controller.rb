class QuestionsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  $p=0
  $len = 0
  def show
  	@questions = Question.where(quiz_type: params[:quiz_type])
  	$len = @questions.size
  	@question = @questions[$p]	
  end
  def update
    $str = ""
  	@questions = Question.where(quiz_type: params[:quiz_type])
  	@question = @questions[$p]
  	@opA = params[:A]
  	@opB = params[:B]
  	@opC = params[:C]
  	@opD = params[:D]
  	if @opA 
  	  $str+="1"
  	end	
  	if @opB
  	 $str+="2"
  	end 
  	if @opC
  	 $str+="3"
  	end 
  	if @opD
  	 $str+="4"
  	end 
  	$message = "Incorrect Answer"
  	if $str.to_i == @question.ans1
  		$message = "Correct Answer"	
  	end	
  	$p+=1
  	if $p < $len		
  		redirect_to "/questions/#{params[:quiz_type]}" , :alert => $message
  	end	
  end	
end
