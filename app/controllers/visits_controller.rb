class VisitsController < ApplicationController

  before_action :authenticate_doctor!, except: :index

  def index
    if current_patient
      @visits = Visit.where(patient_id: current_patient.id)
      @page_title = 'Patient'
      render('patients/visits') && return
    elsif current_doctor
      @page_title = 'Doctor'
      if params[:office_id]
        @visits = Visit.where(doctor_id: current_doctor.id, office_id: params[:office_id])
      else
        @visits = Visit.where(doctor_id: current_doctor.id)
      end
      return
    end
    redirect_to(root_path)
  end

  def edit
    @visit = Visit.find(params[:id])
    @visit.first_name = @visit.patient.first_name
    @visit.last_name = @visit.patient.last_name
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
    @visit = Visit.new
    @visit.doctor = current_doctor
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.doctor = current_doctor
    @visit.patient = Patient.where(first_name: params[:visit][:first_name], last_name:
        params[:visit][:last_name]).first
    logger.debug(@visit)
    if @visit.save
      logger.debug(@visit)
      flash[:notice] = 'Visit created successfully'
      redirect_to(visits_path)
    else
      logger.debug(@visit.errors)
      @visit.doctor = current_doctor
      render('new')
    end
  end

  def destroy
    Visit.destroy(params[:id])
    flash[:notice] = 'Visit deleted successfully'
    redirect_to(visits_path)
  end

  private

  def visit_params
    params.require(:visit).permit(:office_id, :start_time, :end_time, :patient_first_name,
                                  :patient_last_name)
  end
end
