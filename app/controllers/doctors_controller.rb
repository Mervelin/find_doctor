class DoctorsController < ApplicationController
  def index
    @page_title = 'Lista lekarzy'
    logger.debug("************* %#{params[:search_specialization]}% ************")
    @doctors = Doctor.search(params[:search_specialization], params[:search_city])
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end
end
