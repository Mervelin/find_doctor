class Visit < ApplicationRecord

  attr_accessor :duration, :first_name, :last_name

  belongs_to :doctor
  belongs_to :patient
  belongs_to :office
end
