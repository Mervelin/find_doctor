class PatientsController < ApplicationController
  include AccessiblePatients

  before_action :authenticate_patient!
  before_action :set_patient, only: %i[update edit]

  def show
    @patient = current_patient
  end

  def edit
    unless params[:id].to_i == current_patient.id
      flash[:alert] = 'Prohibited action'
      redirect_to(root_path)
    end
  end

  def update
    if @patient.update_attributes(patient_params)
      flash[:notice] = 'Updated successfully'
      redirect_to(dashboard_patients_path)
    else
      render('edit')
    end
  end

  def dashboard
    redirect_to(new_patient_session_path) unless current_patient
    @patient = current_patient
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :phone)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

end
