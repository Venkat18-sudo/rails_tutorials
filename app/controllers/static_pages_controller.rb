class StaticPagesController < ApplicationController
  def home
  	if !!current_user
  		@micropost = current_user.microposts.build
  	end
  end

  def about
  end

  def help
  end
  
  def contact_us
  end
end
