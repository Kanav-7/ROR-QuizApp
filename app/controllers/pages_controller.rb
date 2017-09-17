class PagesController < ApplicationController
  def index
    @allgens = Genre.all 
  end
end
