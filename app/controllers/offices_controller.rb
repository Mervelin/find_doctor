class OfficesController < ApplicationController
  include AccessibleDoctors

  before_action :authenticate_doctor!
  before_action :set_office, only: %i[edit update destroy]

  def index
    @offices = Office.where(doctor_id: current_doctor.id)
  end

  def new
    @office = Office.new(doctor_id: current_doctor.id)
  end

  def create
    @office = Office.new(office_params)
    @office.doctor_id = current_doctor.id

    if @office.save
      flash[:notice] = 'Office created successfully.'
      redirect_to(offices_path)
    else
      render('new')
    end
  end

  def edit
  end

  def update
    if @office.update_attributes(office_params)
      flash[:notice] = 'Office updated successfully'
      redirect_to(offices_path)
    else
      render('edit')
    end
  end

  def destroy
    @office.destroy
  end

  private

  def office_params
    params.require(:office).permit(:city, :postal_code, :street, :nr, :info)
  end

  def set_office
    @office = Office.find(params[:id])
  end
end
