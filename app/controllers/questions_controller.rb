class QuestionsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def leader
	@mystore = Connect.where(quiz: params[:quiz_type]).all.sort_by {|connect| connect.highscore}.reverse
  $msg = Subgenre.find(params[:quiz_type]).name
  	
	if @mystore.empty?
		redirect_to root_path , :alert => "Leaderboard is Empty."
		return
	end
  end	

  def reset
  	@mystore = Connect.where(user: current_user,quiz: params[:quiz_type])
  	@mystore.limit(1).update_all(state: 0,score: 0)
  	redirect_to "/questions/#{params[:quiz_type]}"
  end	 

  def show
  	@questions = Question.where(quiz_type: params[:quiz_type])
  	@mystore = Connect.where(user: current_user,quiz: params[:quiz_type])

  	if @mystore.empty?
	  @mystore = Connect.new(user: current_user,quiz: params[:quiz_type],state: 0,score: 0,highscore: 0)
	  @mystore.save
	  end
	  @mystore = Connect.where(user: current_user,quiz: params[:quiz_type]).first
	  $p = @mystore.state
	  $score = @mystore.score
	  $highscore = @mystore.highscore
	  @question = @questions[$p]
    if @question.nil?
         redirect_to root_path , :alert => "Wait! Quiz is coming soon :)"
    end     

  end


  def update
    $str = ""
  	@questions = Question.where(quiz_type: params[:quiz_type])
  	@question = @questions[$p]
  	$len = @questions.size

    if @question.ans1 < 10
      $str = params[:answer]
    else  
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
    end  

 	$message = "Incorrect Answer"
  	$corr = 0
  	if $str.to_i == @question.ans1
  		$message = "Correct Answer"
  		$score+=100	
  		$corr = 1
  	end	

  	$p+=1

  	if $score > $highscore
  		$highscore = $score
  	end	
  	@mystore = Connect.where(user: current_user,quiz: @question.quiz_type)

	@mystore.limit(1).update_all(state: $p,score: $score,highscore: $highscore)  


 

  	if $p < $len	
  		if $corr == 1
  	  		redirect_to "/questions/#{params[:quiz_type]}" , :notice => $message
		else
  			redirect_to "/questions/#{params[:quiz_type]}" , :alert => $message
  		end
  	else
  		@mystore.limit(1).update_all(state: 0,score: 0) 
  		$message = "Game Over!\n Score = " +  $score.to_s
  		redirect_to "/leaderboard/#{params[:quiz_type]}" , :notice => $message
  	end	

  end	

end



			
