class VisitsController < ApplicationController

  before_action :authenticate_doctor!, except: :index

  def index
    if current_patient
      @visits = Visit.where(patient_id: current_patient.id)
      @page_title = 'Patient'
      render('patients/visits') && return
    end
    @page_title = 'Doctor'
    @visits = Visit.where(doctor_id: current_doctor.id)
  end

  def edit
    @visit = Visit.find(params[:id])
  end

  def update
    @visit = Visit.find(params[:id])

    if @visit.update_attributes(visit_params)
      flash[:notice] = 'Visit updated successfully'
      redirect_to(visits_path)
    else
      render('edit')
    end
  end

  def new
  end

  def create
  end

  def destroy
    Visit.destroy(params[:id])
    flash[:notice] = 'Visit deleted successfully'
    redirect_to(visits_path)
  end

  private

  def visit_params
    params.require(:visit).permit(:office_id, :start_time, :end_time)
  end
end
