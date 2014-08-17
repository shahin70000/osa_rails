class HomePageController < ApplicationController
  def index
    @content = welcome_message
  end
    
end
