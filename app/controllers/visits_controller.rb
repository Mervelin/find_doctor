class VisitsController < ApplicationController

  before_action :authenticate_doctor!, except: :index
  before_action :set_visit, only: %i[edit update]

  def index
    if current_patient
      @visits = Visit.where(patient_id: current_patient.id)
      render('patients/visits')
    elsif current_doctor
      @visits = Visit.where(doctor_lookup_params)
    else
      redirect_to(root_path)
    end
  end

  def edit
    @visit.first_name = @visit.patient.first_name
    @visit.last_name = @visit.patient.last_name
  end

  def update
    if @visit.update_attributes(visit_params)
      flash[:notice] = 'Visit updated successfully'
      redirect_to(visits_path)
    else
      render('edit')
    end
  end

  def new
    @visit = Visit.new(doctor: current_doctor)
  end

  def create
    first_name = params[:visit][:first_name]
    last_name = params[:visit][:last_name]

    @visit = Visit.new(
        visit_params.merge(
            {
                doctor: current_doctor,
                patient: Patient.find_by(first_name: first_name, last_name: last_name)
            }
        )
    )

    if @visit.save
      flash[:notice] = 'Visit created successfully'
      redirect_to(visits_path)
    else
      render('new')
    end
  end

  def destroy
    Visit.destroy(params[:id])
    flash[:notice] = 'Visit deleted successfully'
    redirect_to(visits_path)
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def doctor_lookup_params
    {
        doctor_id: current_doctor.id,
        office_id: params[:office_id]
    }.delete_if { |_k, v| v.blank? }
  end

  def visit_params
    params.require(:visit).permit(:office_id, :start_time, :end_time, :patient_first_name,
                                  :patient_last_name)
  end
end
