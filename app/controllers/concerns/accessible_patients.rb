module AccessiblePatients
  extend ActiveSupport::Concern
  included do
    before_action :check_patient
  end

  protected
  def check_patient
    #flash.clear
    redirect_to(dashboard_doctors_path) if current_doctor
  end
end