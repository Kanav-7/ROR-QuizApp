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

  end
end
