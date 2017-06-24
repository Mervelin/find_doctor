class WelcomeController < ApplicationController

  def index
    @page_title = 'Welcome'
  end

  def doctors
    @page_title = 'Searched doctors'
    @doctors = Doctor.search(params[:search_specialization], params[:search_city])
    @doctors = nil if @doctors.empty?
  end

  def doctor
    @doctor = Doctor.find(params[:id])
  end

end
