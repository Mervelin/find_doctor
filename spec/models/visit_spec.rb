require 'rails_helper'

describe Visit do
  it 'does not allow overlapping visits' do
    patient = Patient.create(email: 'tester@tester.com', password: 'password')
    doctor = Doctor.create(email: 'doctor@doctor.com', password: 'password')
    office = Office.create(doctor_id: doctor.id)
    patient.visits.create(doctor_id: doctor.id, office_id: office.id,
                          start_time: '2000-01-01 12:00:00'.to_datetime,
                          end_time: '2000-01-01 13:00:00'.to_datetime)
    visit = patient.visits.new(doctor_id: doctor.id, office_id: office.id,
                               start_time: '2000-01-01 12:30:00'.to_datetime)

    expect(visit).to_not be_valid
  end

end