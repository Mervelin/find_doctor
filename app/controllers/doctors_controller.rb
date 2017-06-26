class DoctorsController < ApplicationController
  include AccessibleDoctors

  before_action :authenticate_doctor!
  before_action :set_doctor, only: %i[edit update]

  def edit
    unless params[:id].to_i == current_doctor.id
      flash[:alert] = 'Prohibited action'
      redirect_to(root_path) && return
    end
  end

  def update
    if @doctor.update_attributes(doctor_params)
      flash[:notice] = 'Updated successfully'
      redirect_to(dashboard_doctors_path)
    else
      render('edit')
    end
  end

  def dashboard
    redirect_to(new_doctor_session_path) unless current_doctor
    @doctor = current_doctor
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :title, :phone, :specialization,
                                   :description)
  end

  def set_doctor
    @office = Office.find(params[:id])
  end
end
