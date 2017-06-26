require 'rails_helper'

describe Doctor do
  it 'has a valid factory' do
    expect(build(:doctor)).to be_valid
  end
  it 'is invalid without a email' do
    expect(build(:doctor, email: nil)).to_not be_valid
  end
  it 'is invalid without a password' do
    expect(build(:doctor, password: nil)).to_not be_valid
  end
  it 'is invalid with a duplicate email address' do
    create(:doctor, email: 'tester@tester.com')
    doctor = build(:doctor, email: 'tester@tester.com')
    expect(doctor).to_not be_valid
  end
  it "returns a doctor's full name with title as string" do
    doctor = build(:doctor, title: 'dr')
    expect(doctor.name).to eq 'dr John Walker'
  end
end