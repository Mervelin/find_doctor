class DoctorsController < ApplicationController
  include AccessibleDoctors

  before_action :authenticate_doctor!

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def dashboard
    redirect_to(new_doctor_session_path) unless current_doctor
    @doctor = current_doctor
    @page_title = 'Panel Lekarza'
  end
end
