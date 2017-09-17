class PagesController < ApplicationController
  def index
    
  	@mystore = Connect.where(user: current_user,quiz: 1)
  	if @mystore.empty?
  		$sc1 = "Not Attempted"
      $hsc1 = "Not Attempted"
      $st1 = 0
  	else
  		$sc1 = @mystore.first.score
      $st1 = @mystore.first.state
      $hsc1 = @mystore.first.highscore
  	end		

  	@mystore = Connect.where(user: current_user,quiz: 2)
  	if @mystore.empty?
  		$sc2 = "Not Attempted"
      $hsc2 = "Not Attempted"
      $st2 = 0
  	else
  		$sc2 = @mystore.first.score
      $st2 = @mystore.first.state	
      $hsc2 = @mystore.first.highscore        
  	end	

    @mystore = Connect.where(user: current_user,quiz: 3)
    if @mystore.empty?
      $sc3 = "Not Attempted"
      $hsc3 = "Not Attempted"
      $st3 = 0
    else
      $sc3 = @mystore.first.score
      $st3 = @mystore.first.state
      $hsc3 = @mystore.first.highscore
    end   

    @mystore = Connect.where(user: current_user,quiz: 4)
    if @mystore.empty?
      $sc4 = "Not Attempted"
      $hsc4 = "Not Attempted"
      $st4 = 0
    else
      $sc4 = @mystore.first.score
      $st4 = @mystore.first.state 
      $hsc4 = @mystore.first.highscore  
    end 
	
  end
end
