class WelcomeController < ApplicationController

  def index
    @page_title = 'Welcome'
  end

  def doctors
    @page_title = 'Lista lekarzy'
    @doctors = Doctor.search(params[:search_specialization], params[:search_city])
  end

  def doctor
    @doctor = Doctor.find(params[:id])
  end

end
