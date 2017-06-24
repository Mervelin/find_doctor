class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :visits
  has_many :offices
  has_many :timetables

  def self.search search_specialization, search_city
    return all if search_specialization.blank? && search_city.blank?
    where(['upper(specialization) LIKE upper(?)', "%#{search_specialization}%"])
      .joins(:offices).where(['upper(city) LIKE upper(?)', "%#{search_city}%"])

  end

  def name
    "#{title} #{first_name} #{last_name}"
  end
end
