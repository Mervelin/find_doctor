class Visit < ApplicationRecord

  attr_accessor :duration

  belongs_to :doctor
  belongs_to :patient
  belongs_to :office
end
