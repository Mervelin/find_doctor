class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :visits
  has_many :offices
  has_many :timetables

  scope :sorted, -> { order(created_at: :desc) }

  def self.search search_specialization, search_city
    return sorted if search_specialization.blank? && search_city.blank?

    where(['upper(specialization) LIKE upper(?)', "%#{search_specialization}%"])
      .joins(:offices).where(['upper(city) LIKE upper(?)', "%#{search_city}%"])
  end

  def name
    "#{title} #{first_name} #{last_name}"
  end
end
