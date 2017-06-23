class Doctor < ApplicationRecord

  has_many :visits
  has_many :offices
  has_many :timetables

  def self.search search_specialization, search_city
    return unless search_specialization.present? && search_city.present?
    where(['upper(specialization) LIKE upper(?)', "%#{search_specialization}%"])
      .joins(:offices).where(['upper(city) LIKE upper(?)', "%#{search_city}%"])

  end

  def name
    "#{title} #{first_name} #{last_name}"
  end
end
