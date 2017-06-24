class PatientsController < ApplicationController
  include AccessiblePatients

  before_action :authenticate_patient!
  def show
    @patient = current_patient
  end

  def edit
  end

  def create
  end

  def dashboard
    redirect_to(new_patient_session_path) unless current_patient
    @patient = current_patient
    @page_title = 'Panel Pacjenta'
  end

end
