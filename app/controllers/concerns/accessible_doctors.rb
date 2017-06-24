module AccessibleDoctors
  extend ActiveSupport::Concern
  included do
    before_action :check_doctor
  end

  protected
  def check_doctor
    #flash.clear
    redirect_to(dashboard_patients_path) if current_patient
  end
end