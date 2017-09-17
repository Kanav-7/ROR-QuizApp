class PagesController < ApplicationController
  def index

  	@mystore = Connect.where(user: current_user,quiz: 1)
  	if @mystore.empty?
  		$sc1 = 0
  	else
  		$sc1 = @mystore.first.score
  	end		

  	@mystore = Connect.where(user: current_user,quiz: 2)
  	if @mystore.empty?
  		$sc2 = 0
  	else
  		$sc2 = @mystore.first.score	
  	end	

  	@mystore = Connect.where(user: current_user,quiz: 1)
  	if @mystore.empty?
  		$hsc1 = 0
  	else
  		$hsc1 = @mystore.first.highscore
  	end		

  	@mystore = Connect.where(user: current_user,quiz: 2)
  	if @mystore.empty?
  		$hsc2 = 0
  	else
  		$hsc2 = @mystore.first.highscore	
  	end	

  end
end
