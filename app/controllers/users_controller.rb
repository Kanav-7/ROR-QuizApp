class UsersController < ApplicationController
	def profile
		@user = User.find(params[:id])
		@mystore = Connect.where(user: @user,quiz: 1)
	  	if @mystore.empty?
	      $hsc1 = "Not Attempted"
	  	else
	      $hsc1 = @mystore.first.highscore
  	    end		

	  	@mystore = Connect.where(user: @user,quiz: 2)
	  	if @mystore.empty?
	      $hsc2 = "Not Attempted"
	  	else	
	      $hsc2 = @mystore.first.highscore        
	  	end	

	    @mystore = Connect.where(user: @user,quiz: 3)
	    if @mystore.empty?
	      $hsc3 = "Not Attempted"
	    else
	      $hsc3 = @mystore.first.highscore
	    end   

	    @mystore = Connect.where(user: @user,quiz: 4)
	    if @mystore.empty?
	      $hsc4 = "Not Attempted"
	    else
	      $hsc4 = @mystore.first.highscore  
	    end 
		
	end
end	
