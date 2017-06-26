class Visit < ApplicationRecord
  attr_accessor :duration, :first_name, :last_name

  belongs_to :doctor
  belongs_to :patient
  belongs_to :office

  validate :time_overlap

  def time_overlap
    return if Visit.where('start_time <= ?', start_time)
                      .where('end_time >= ?', start_time)
                  .where(patient_id: patient_id).or(Visit.where(doctor_id: doctor_id)).empty?
    errors.add(:start_time, 'overlaps existing visit')
  end
end
