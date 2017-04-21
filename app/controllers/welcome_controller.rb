class WelcomeController < ApplicationController


  def index
    @resumes = Resume.where(:is_show => true )
  end
end
