class WelcomeController < ApplicationController

  def index
    @doctors = Doctor.all
    @page_title = 'Welcome'
  end

end
