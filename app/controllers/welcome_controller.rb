class WelcomeController < ApplicationController

  def index
  end

  def doctors
    @doctors = Doctor.search(params[:search_specialization], params[:search_city])
    @doctors = nil if @doctors.empty?
  end

  def doctor
    @doctor = Doctor.find(params[:id])
  end

end
