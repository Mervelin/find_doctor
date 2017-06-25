class OfficesController < ApplicationController
  include AccessibleDoctors

  before_action :authenticate_doctor!
  before_action :page_title

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
    @office = Office.find(params[:id])
  end

  def update
    @office = Office.find(params[:id])
    if @office.update_attributes(office_params)
      flash[:notice] = 'Office updated successfully'
      redirect_to(offices_path)
    else
      render('edit')
    end
  end

  def destroy
    @office = Office.find(params[:id])
    @office.destroy
  end

  private

  def office_params
    params.require(:office).permit(:city, :postal_code, :street, :nr, :info)
  end

  def page_title
    @page_title = 'Doctor'
  end
end
