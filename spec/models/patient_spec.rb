require 'rails_helper'

describe Patient do
  it 'is valid with a email, password' do
    patient = Patient.new(email: 'demo@demo.com', password: 'demodemo')
    expect(patient).to be_valid
  end
  it 'is invalid without a email' do
    expect(Patient.new(email: nil)).to_not be_valid
  end
  it 'is invalid without a password' do
    expect(Patient.new(password: nil)).to_not be_valid
  end
  it 'is invalid with a duplicate email address' do
    Patient.create( email: 'tester@tester.com', password: 'password')
    patient = Patient.new(email: 'tester@tester.com', password: 'password')
    expect(patient).to_not be_valid
  end
  it "returns a patient's full name as string" do
    patient = Patient.new(first_name: 'John', last_name: 'Walker')
    expect(patient.name).to eq 'John Walker'
  end
end